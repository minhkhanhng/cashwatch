# Bật đồng bộ bằng email (Supabase)

CashWatch luôn lưu sổ trên máy trước. Khi bật đồng bộ, người dùng đăng nhập bằng mã gửi qua email, và sổ được lưu thêm vào Supabase để mở trên máy khác.

Làm một lần, khoảng 10 phút.

## 1. Tạo project

1. Vào https://supabase.com, đăng nhập bằng GitHub.
2. **New project**: đặt tên `cashwatch`, chọn region **Southeast Asia (Singapore)**, đặt một database password (tự lưu, không gửi cho ai).
3. Chờ project tạo xong (khoảng 1–2 phút).

## 2. Tạo bảng

1. Menu trái → **SQL Editor** → **New query**.
2. Dán toàn bộ nội dung file `supabase/schema.sql` → **Run**.
3. Thấy `Success. No rows returned` là xong.

## 3. Cấu hình đăng nhập

1. **Authentication → Sign In / Providers → Email**: bật **Enable Email provider**. Có thể tắt *Confirm email* (mã đăng nhập đã xác nhận email rồi).
2. **Authentication → URL Configuration**:
   - **Site URL**: địa chỉ production, ví dụ `https://<tên-app>.vercel.app`
   - **Redirect URLs**: thêm địa chỉ production, địa chỉ staging và `http://localhost:8765`
3. **Authentication → Emails**: sửa **cả hai** mẫu **Magic Link** và **Confirm signup** để email có **mã 6 số** (người mới đăng nhập lần đầu nhận mẫu Confirm signup), ví dụ:

   ```html
   <h2>Mã đăng nhập CashWatch</h2>
   <p>Mã của bạn: <strong style="font-size:24px;letter-spacing:4px">{{ .Token }}</strong></p>
   <p>Mã có hiệu lực trong 1 giờ. Nếu bạn không yêu cầu, hãy bỏ qua email này.</p>
   ```

   App dùng mã thay vì link vì khi app đã cài lên màn hình chính, link trong email thường mở sang trình duyệt khác.

## 4. Lấy 2 giá trị công khai

**Project Settings → API Keys** (và **Data API** để lấy URL):

- **Project URL**: dạng `https://xxxx.supabase.co`
- Khóa công khai: **anon public** (tab *Legacy API keys*, bắt đầu bằng `eyJ…`) hoặc **publishable** (`sb_publishable_…`)

Hai giá trị này là **công khai**, được thiết kế để nằm trong mã web; quyền truy cập do Row Level Security ở bước 2 quyết định.

> **Không bao giờ** dùng hay gửi **service_role** key hoặc **secret** key (`sb_secret_…`). Các key đó bỏ qua mọi giới hạn bảo mật.

Điền vào đầu phần `<script>` trong `index.html`:

```js
const SUPABASE = { url: "https://xxxx.supabase.co", anonKey: "eyJ..." };
```

## Giới hạn cần biết

- Gói miễn phí dùng máy chủ email có sẵn của Supabase, chỉ gửi được **vài email mỗi giờ**. Đủ cho dùng cá nhân. Nhiều người dùng thì cần cấu hình SMTP riêng (Authentication → Emails → SMTP Settings).
- Project miễn phí **tạm dừng sau 7 ngày không có ai dùng**; mở lại trong trang Supabase là chạy tiếp. Sổ trên máy không bị ảnh hưởng.
- Khi hai máy cùng sửa lúc mất mạng, app gộp giao dịch của cả hai. Một khoản đã xóa ở máy này có thể hiện lại nếu máy kia vẫn còn giữ nó.
