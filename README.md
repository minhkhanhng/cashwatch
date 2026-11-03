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
- **Excel:** tải file mẫu, nhập dữ liệu, xuất toàn bộ sổ. File xuất ra nhập lại được ngay.

## Dữ liệu

- Dữ liệu chỉ lưu trong `localStorage` của trình duyệt bạn đang dùng, không gửi lên server nào.
- File Excel được đọc và tạo ngay trên máy bằng [SheetJS](https://sheetjs.com).
- Xóa dữ liệu trình duyệt là mất sổ, nên hãy **xuất file Excel** định kỳ để sao lưu (biểu tượng bánh răng → Dữ liệu).

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
