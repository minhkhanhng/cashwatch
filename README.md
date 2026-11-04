# CashWatch

Sổ thu chi cá nhân chạy hoàn toàn trên trình duyệt. Toàn bộ app nằm trong một file `index.html`: không cần server, không cần build.

## Tính năng

- **Tổng quan:** tài sản ròng, số còn tiêu được trong tháng, biểu đồ thu chi 6 tháng, chi tiêu theo danh mục.
- **Ghi nhanh một dòng:** gõ `cà phê 45k x2`, `1tr5 vé xe`, `200+130k quà`, `+15tr lương`. App tự hiểu số tiền, số lượng và danh mục, và học dần theo cách bạn ghi.
- **Sổ giao dịch** nhóm theo ngày.
- **Khoản cố định:** mỗi tháng tự hiện ra để bấm xác nhận. Đặt được tháng bắt đầu, tháng kết thúc và các mốc thay đổi số tiền.
- **Ngân sách theo danh mục**, thay đổi được từ một tháng bất kỳ trở đi.
- **Kế hoạch tiết kiệm:** sổ gửi có kỳ hạn, lãi suất thay đổi theo mốc thời gian, làm tròn khi gửi lại, một hoặc nhiều khoản vay. App tính ra kỳ nào trả xong nợ.
- **Chốt sổ cuối tháng:** đối chiếu tiền thực có với số dư theo sổ.
- **Danh mục tự tạo** với biểu tượng và màu riêng; ẩn được danh mục có sẵn.
- **Nhiều ví:** tiền mặt, ngân hàng, ví điện tử; chuyển tiền giữa các ví; chốt sổ theo từng ví.
- **Cài như app (PWA):** thêm vào màn hình chính, dùng được khi mất mạng.
- **Nhắc ghi chép mỗi tối** qua Google Calendar hoặc ứng dụng Lịch.
- **Sao lưu và chuyển máy** bằng một file `.json`, khôi phục y nguyên trên máy khác.
- **Excel:** tải file mẫu, nhập dữ liệu, xuất toàn bộ sổ. File xuất ra nhập lại được ngay.

## Dữ liệu

- Mặc định dữ liệu chỉ lưu trong `localStorage` của trình duyệt bạn đang dùng, không gửi lên server nào.
- **Đồng bộ (không bắt buộc):** khi điền thông tin Supabase, người dùng đăng nhập bằng mã gửi qua email và sổ được lưu thêm lên tài khoản để mở trên máy khác. Cách bật: xem `docs/dong-bo-supabase.md` và `supabase/schema.sql`.
- File Excel được đọc và tạo ngay trên máy bằng [SheetJS](https://sheetjs.com).
- Xóa dữ liệu trình duyệt là mất sổ, nên hãy **tạo file sao lưu** định kỳ (biểu tượng bánh răng → Tạo file sao lưu). File này cũng dùng để chuyển sổ sang máy khác.
- `sw.js` chỉ lưu giao diện app để mở được khi mất mạng, không đụng tới dữ liệu sổ.

## Chạy trên máy

Mở `index.html` bằng trình duyệt, hoặc chạy một server tĩnh:

```bash
python3 -m http.server 8000
```

rồi vào http://localhost:8000

## Deploy lên Vercel

1. Import repo này trên [vercel.com/new](https://vercel.com/new).
2. Ở **Framework Preset** chọn **Other**, để trống Build Command và Output Directory.
3. Bấm **Deploy**.
