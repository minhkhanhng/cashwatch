# Nhật ký thay đổi

## v0.3.0 · Danh mục riêng, nhiều ví, cài như app · 04/11/2026

**Mới**
- **Danh mục tự tạo:** đặt tên, chọn biểu tượng và màu. Tạo ngay trong ô ghi nhanh (ô "Thêm" cuối lưới danh mục) hoặc ở Cài đặt → Danh mục. Ẩn được danh mục có sẵn không dùng tới.
- **Nhiều ví:** tách tiền mặt, ngân hàng, ví điện tử. Chạm ô "Tiền đang có" để xem số dư từng ví, thêm ví, chuyển tiền giữa các ví. Khi ghi giao dịch, chọn ví bằng một chạm. Chốt sổ nhập số thực tế theo từng ví.
- **Cài lên màn hình chính (PWA):** mở như một app riêng, dùng được khi mất mạng. Giữ biểu tượng app để có lối tắt "Ghi giao dịch".
- **Nhắc ghi chép mỗi tối:** thêm lời nhắc lặp lại hằng ngày vào Google Calendar hoặc ứng dụng Lịch trên iPhone.
- **Sao lưu và chuyển máy:** tạo một file sao lưu chứa toàn bộ sổ. Trên điện thoại, file được gửi thẳng qua Zalo, AirDrop, email. Trên máy mới, chọn "Đã dùng CashWatch trên máy khác?" để khôi phục y nguyên.

**Đổi**
- Trang Cài đặt sắp lại thành các nhóm: Sổ của bạn, Dùng hằng ngày, Sao lưu và chuyển máy, Excel.
- File Excel có thêm cột Ví và sheet Ví. Tên danh mục lạ trong file được tạo thành danh mục mới thay vì gộp vào "Khác".
- Thẻ nhắc sao lưu trên Tổng quan dùng file sao lưu thay cho Excel.
- Ô nhập khoản cố định lúc thiết lập cũng hiện số đầy đủ (gõ `4tr` thấy `= 4.000.000 ₫`).
- Tháng bắt đầu giữa chừng ghi rõ "Đầu tháng (tính ngược)".

**Sửa**
- Lúc thiết lập, nếu tiền đang có ít hơn số tính ra từ lương và khoản đã trả, phần chênh lệch được ghi thành một dòng điều chỉnh "Đã chi trước khi ghi sổ", không còn số dư đầu tháng bị âm.
- Xuất rồi nhập lại Excel giữ đúng số "Còn tiêu được" của tháng bắt đầu giữa chừng.

## v0.2.1 · Dễ hiểu hơn ngay từ ngày đầu · 04/11/2026

**Đổi**
- Thanh tab mới: Tổng quan · Giao dịch · Ngân sách · Kế hoạch. Ngân sách có tab riêng; Kế hoạch gồm Khoản cố định và Mục tiêu tiết kiệm.
- Chốt sổ không còn chiếm một tab. Mở từ nút "Chốt sổ" trong màn Giao dịch, từ ô "Tiền đang có", hoặc từ thẻ nhắc trên Tổng quan (khi tháng trước chưa chốt và 3 ngày cuối tháng).
- Thông báo hiện ở dưới, ngay trên thanh tab, gần ngón cái. Trong ô ghi nhanh, thông báo nằm trên nút Ghi và không che nút Xong.
- Biểu đồ thu chi chỉ hiện khi đã có từ 2 tháng dữ liệu.
- Số 0 hiện là "0" thay vì "+0", "−0" hay "+0 ₫".
- Gợi ý "Ghi lại khoản gần đây" không còn lặp lại khoản cố định.

**Sửa**
- Lúc thiết lập, khoản thu nhập và khoản cố định chọn "Tháng này đã nhận/đã trả" giờ được ghi thành giao dịch, nên Thu, Chi tiêu và Để dành hiện đúng ngay. Trước đây các khoản này bị ẩn và mọi số đều là 0.

## v0.2.0 · Ghi nhanh trong 1 phút · 03/11/2026

**Mới**
- Thiết lập lần đầu bằng 3 câu hỏi: tiền đang có, thu nhập, các khoản cố định. Xong là dùng được ngay.
- Ô ghi nhanh mới: số tiền hiện to rõ khi gõ, chọn danh mục bằng biểu tượng, chọn Hôm nay / Hôm qua / ngày khác bằng một chạm.
- Ghi lại khoản gần đây: chạm một khoản đã ghi trước đó để điền lại cả nội dung, số tiền và danh mục.
- Tìm giao dịch theo nội dung hoặc danh mục trong mọi tháng, lọc riêng khoản chi hoặc khoản thu.
- Nút "Xác nhận tất cả" cho các khoản cố định trong tháng.
- Thẻ "Bắt đầu nhanh" hướng dẫn người mới và tự ẩn khi đã làm xong.
- Nhắc sao lưu sổ ra Excel khi đã lâu chưa sao lưu.
- Trên máy tính: bấm phím N để mở ô ghi nhanh.

**Đổi**
- Mỗi danh mục có biểu tượng và màu riêng, dễ nhận ra trong danh sách.
- Giải thích ngay trên màn hình "Tài sản ròng" là gì và "Còn tiêu được" được tính thế nào.
- Ô nhập tiền hiện số đầy đủ ngay bên dưới (gõ `1tr5` sẽ thấy `= 1.500.000 ₫`).
- Màn giao dịch thêm ô chọn ngày chính xác thay cho chọn tháng.
- Chữ phụ to hơn, dễ đọc hơn.

**Sửa**
- Tháng đầu tiên: "Còn tiêu được" tính theo số tiền bạn đang có, không bị âm khi lương tháng này đã nhận trước khi dùng app.

## v0.1.0 · Bản đầu tiên · 03/11/2026

- Tổng quan, ghi nhanh một dòng, sổ giao dịch, khoản cố định, ngân sách, kế hoạch tiết kiệm trả nợ, chốt sổ, nhập/xuất Excel.
