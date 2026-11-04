# CashWatch: hướng dẫn cho trợ lý AI

File này dành cho mọi trợ lý lập trình (Antigravity, Claude Code, Cursor…). Đọc hết trước khi sửa code.

## Tổng quan

Sổ thu chi cá nhân, mobile-first, giao diện tiếng Việt. Mọi trao đổi với chủ dự án viết bằng tiếng Việt, xưng "tôi", gọi "bạn".

- **Không có build, không có framework.** Toàn bộ app là HTML, CSS và JavaScript thuần trong `index.html`. Không thêm bundler, npm package hay framework.
- Dữ liệu lưu trong `localStorage`, có thể đồng bộ thêm lên Supabase khi người dùng đăng nhập.
- Thư viện ngoài chỉ tải từ CDN và chỉ khi cần: SheetJS `0.18.5` (cdnjs), `@supabase/supabase-js@2.45.4` (jsdelivr). Luôn ghim đúng phiên bản.

| File | Vai trò |
|---|---|
| `index.html` | Toàn bộ app: CSS ở `<style>`, logic ở `<script>` |
| `sw.js` | Service worker: lưu giao diện để chạy khi mất mạng (không đụng dữ liệu sổ) |
| `manifest.webmanifest`, `icons/` | Cài lên màn hình chính (PWA) |
| `supabase/schema.sql` | Bảng `cashwatch_books` + Row Level Security |
| `docs/dong-bo-supabase.md` | Hướng dẫn bật đăng nhập Google/email |
| `CHANGELOG.md` | Nhật ký thay đổi theo phiên bản |

`.vercelignore` chặn `*.md`, `docs/`, `supabase/` khỏi bản deploy.

## Chạy thử trên máy

```bash
cd cashwatch && python3 -m http.server 8765
```

Mở http://localhost:8765. Địa chỉ này nằm trong danh sách Redirect URLs của Supabase nên đăng nhập Google chạy được khi chạy thử trên máy.

## Bản đồ `index.html`

Tìm theo các dòng chú thích `/* ---------- … ---------- */`:

- **Design system** (đầu `<style>`): token màu sáng/tối, quy tắc thiết kế.
- **Categories**: `OUT_CATS`, `IN_CATS` (id tiếng Anh, nhãn tiếng Việt, `kw` là từ khóa không dấu), `CAT_LOOK` (biểu tượng + màu), `ICON` (SVG nét).
- **Amount parsing / Quick-add parser**: `parseMoney` ("45k", "1tr5", "200+130k"), `parseQuick`, `guessCat`.
- **State**: `S` (cài đặt), `M` (tháng → mảng giao dịch), `totals`, `openingOf`, `safeToSpend`, `pendingRec`.
- **Savings plan**: `computeGoal` (sổ tiết kiệm đáo hạn, lãi theo mốc, khoản vay).
- **Storage** (`Store`) và **Đồng bộ** (`Sync`, `mergeBooks`).
- **Ví** (`walletsNow`, `assetsNow`, `WALLET_TYPES`) và **Màn Tài sản** (`renderWallets`).
- **Rendering**: `renderHome`, `renderMonth`, `renderBudget`, `renderFixed`, `renderGoal`, `renderClose`, `renderWelcome`, `render()`.
- **Sheets**: popup trượt từ dưới lên (`openSheet`, `closeSheet`, `open…Sheet`).
- **Excel**: `parseWorkbook`/`readWorkbook` (nhập), `exportExcel`, `downloadTemplate`.
- **Events**: một bộ xử lý `click` duy nhất, chuyển theo `data-act="…"`. Nút mới thì thêm `data-act` và một `case` ở đây.

### Mô hình dữ liệu (không được phá vỡ)

- Khóa `localStorage`: `cashwatch-v1` = `{ settings: S, months: M }`; `cashwatch-sync` = thông tin đồng bộ.
- Giao dịch: `{ id, m: "YYYY-MM", d: "YYYY-MM-DD", kind: "in"|"out", amt, unit, qty, desc, cat, n, at, rid?, w?, adj? }`.
  - `rid`: sinh từ khoản cố định. `w`: id ví (không có = Ví chính). `adj: true`: dòng điều chỉnh số dư, **không** tính vào thu/chi và chi tiêu theo danh mục.
- Ví khác Ví chính: `{ id, name, icon, start, at, limit? }`. Ví chính luôn được tính = tổng tiền theo sổ − các ví khác. Thẻ tín dụng (`icon: "card"`) có số dư âm = dư nợ.
- Thêm trường mới vào `S` thì đặt giá trị mặc định trong `DEFAULTS()`, để sổ cũ mở ra không lỗi. Không đổi tên hay xóa trường cũ khi chưa có code chuyển đổi.
- Đổi định dạng dữ liệu thì phải giữ được: sao lưu `.json` → khôi phục, Excel xuất → nhập lại, đồng bộ giữa hai máy.

## Design system (bắt buộc)

- **Font giữ nguyên**: Bricolage Grotesque (tiêu đề, số lớn), Be Vietnam Pro (chữ thường).
- **Bảng màu MP076**: navy `#001F3F`, xanh chanh `#DBE64C`, trắng ngà `#F6F7ED`, xanh `#1E488F`, xanh lá `#00804C`/`#00733F`, Mantis `#74C365`.
- **Chỉ dùng token CSS** (`var(--ink)`, `var(--accent)`, `var(--surface)`…), không viết mã màu trực tiếp trong component. Có token cho nền tối, nên mọi thay đổi phải đẹp ở cả hai chế độ.
- **Độ tương phản WCAG AA**: chữ ≥ 4.5:1, đồ họa ≥ 3:1. Xanh chanh **chỉ làm nền** cho chữ/biểu tượng navy, không bao giờ làm chữ trên nền sáng.
- Thẻ bo 20–24px; nút, chip, công tắc dạng viên thuốc. Nút cao ≥ 40px, nút khối 50px, chip chọn ≥ 40px.
- Mỗi màn chỉ có **một** khối đậm nhất là nút chính (`.btn.primary`). Chip đang chọn dùng kiểu nhẹ (nền `--accent-soft`).
- Popup: con trực tiếp của `.sheet` không được co (`.sheet > * { flex-shrink: 0 }`), để cả popup cuộn được tới cuối.
- Số tiền không được bẻ dòng (`white-space: nowrap`); tiêu đề dài xuống tối đa 2 dòng.
- **Chữ trên giao diện**: tiếng Việt tự nhiên, ngắn gọn. Không thêm dòng giải thích lặp lại điều đã rõ trên màn hình.

## Bảo mật và quyền riêng tư

- **Không bao giờ** commit: service_role key, secret key (`sb_secret_…`), Google client secret, database password, token GitHub. Khóa `sb_publishable_…` trong `index.html` là khóa công khai, được phép.
- Không đưa dữ liệu cá nhân (tên thật, số tiền thật, email) vào repo; repo này công khai.
- Không hỏi, xem hay nhập token/mật khẩu. Gặp lỗi xác thực khi `git push` thì dừng lại và nhờ chủ dự án tự đăng nhập.

## Quy trình sửa và phát hành

1. Tạo nhánh mới từ `origin/main` (vd `feature/ten-viec`). Không sửa trực tiếp trên `main`.
2. Sửa xong thì cập nhật `CHANGELOG.md`. Đổi phiên bản thì sửa `APPV` trong `index.html`. Sửa file được service worker lưu thì tăng `VERSION` trong `sw.js`.
3. Tự kiểm tra trước khi đẩy:
   - bề rộng 320, 375, 430px; nền sáng và tối;
   - mọi popup cuộn được tới nút cuối;
   - console không có lỗi;
   - ghi nhanh, ví, chốt sổ, sao lưu/khôi phục còn chạy đúng.
4. Đẩy nhánh và đẩy lên staging: `git push origin <nhánh>` rồi `git push origin <nhánh>:staging`. Gửi link staging cho chủ dự án duyệt.
5. **Chỉ khi chủ dự án đồng ý** mới gộp vào `main`: `git merge --ff-only`, gắn tag `vX.Y.Z`, đẩy `main` và tag. **Không bao giờ** `git push --force` lên `main`.
6. Kiểm tra production bằng cách so mã băm `index.html` trên máy với bản tải từ địa chỉ production. Trạng thái "success" trên GitHub có thể đến từ bản build staging của cùng commit, nên không đủ để kết luận.
7. Xóa nhánh đã gộp (trên máy và trên GitHub).
