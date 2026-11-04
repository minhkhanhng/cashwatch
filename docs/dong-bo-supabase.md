# Bật đăng nhập và đồng bộ (Supabase)

CashWatch luôn lưu sổ trên máy trước. Khi bật đồng bộ, người dùng đăng nhập bằng **Google** hoặc **link gửi qua email**, và sổ được lưu thêm vào Supabase để mở trên máy khác.

Làm một lần, khoảng 15 phút. Thay `<app>` bằng địa chỉ thật của app (vd `ten-app.vercel.app`).

## 1. Tạo project Supabase

1. Vào https://supabase.com, đăng nhập bằng GitHub.
2. **New project**: đặt tên `cashwatch`, region **Southeast Asia (Singapore)**, đặt database password (tự giữ, không gửi ai).

## 2. Tạo bảng

**SQL Editor → New query** → dán toàn bộ file `supabase/schema.sql` → **Run**. Thấy `Success` là xong.

## 3. Địa chỉ được phép quay về

**Authentication → URL Configuration**:

- **Site URL**: `https://<app>`
- **Redirect URLs** (Add URL cho từng dòng):
  - `https://<app>/**`
  - địa chỉ staging, vd `https://<app-staging>/**`
  - `http://localhost:8765/**`

## 4. Đăng nhập bằng email (có sẵn)

**Authentication → Sign In / Providers → Email**: bật **Enable Email provider**.

Không cần sửa mẫu email. Email mặc định có nút đăng nhập; người dùng bấm nút đó **trên chính máy đang dùng** là app tự mở lại và đăng nhập.

> Gói miễn phí chỉ gửi được vài email mỗi giờ và không cho sửa mẫu thư nếu chưa có SMTP riêng. Đăng nhập Google không bị giới hạn này.

## 5. Đăng nhập bằng Google

### 5a. Lấy Callback URL từ Supabase

**Authentication → Sign In / Providers → Google**: bật lên, copy dòng **Callback URL (for OAuth)**, dạng `https://xxxx.supabase.co/auth/v1/callback`. Để tab này mở.

### 5b. Tạo OAuth client trên Google Cloud

1. Vào https://console.cloud.google.com, chọn **Select a project → New project**, đặt tên `CashWatch` → **Create**.
2. Menu **APIs & Services → OAuth consent screen** (giao diện mới gọi là **Google Auth Platform**) → **Get started**:
   - App name: `CashWatch`
   - User support email: Gmail của bạn
   - Audience: **External**
   - Contact information: Gmail của bạn → **Create**
3. **Audience → Publish app** để ai cũng đăng nhập được. App chỉ xin email và tên nên không cần Google duyệt.
4. **Clients → Create client**:
   - Application type: **Web application**, name: `CashWatch web`
   - **Authorized JavaScript origins**: `https://<app>` và địa chỉ staging
   - **Authorized redirect URIs**: dán Callback URL ở bước 5a
   - **Create** → copy **Client ID** và **Client secret**

### 5c. Dán vào Supabase

Quay lại tab Google provider của Supabase: dán **Client ID** và **Client Secret** → **Save**.

> Client secret chỉ dán vào Supabase. Không gửi cho ai, không đưa vào mã nguồn.

## 6. Điền 2 giá trị công khai vào app

**Project Settings → API Keys** (URL ở **Data API**):

- **Project URL**: `https://xxxx.supabase.co`
- Khóa công khai: **publishable** (`sb_publishable_…`) hoặc **anon public** (tab *Legacy API keys*, bắt đầu `eyJ…`)

Hai giá trị này công khai, được thiết kế để nằm trong mã web; quyền truy cập do Row Level Security ở bước 2 quyết định.

```js
const SUPABASE = { url: "https://xxxx.supabase.co", anonKey: "sb_publishable_..." };
```

> **Không bao giờ** dùng **service_role** hay **secret** key (`sb_secret_…`) ở đây.

## Giới hạn cần biết

- Project miễn phí **tạm dừng sau 7 ngày không ai dùng**; mở lại trong trang Supabase là chạy tiếp. Sổ trên máy không bị ảnh hưởng.
- Trên iPhone, app đã cài lên màn hình chính có thể mở trang đăng nhập Google trong cửa sổ Safari. Nếu đăng nhập xong mà app chưa nhận, mở lại app từ màn hình chính.
- Hai máy cùng sửa lúc mất mạng thì app gộp giao dịch của cả hai; một khoản đã xóa ở máy này có thể hiện lại nếu máy kia vẫn còn giữ.
