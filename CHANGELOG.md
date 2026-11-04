# Nhật ký thay đổi

## v0.3.0 · Danh mục riêng, nhiều ví, cài như app · 04/11/2026

**Mới**
- **Danh mục tự tạo:** đặt tên, biểu tượng, màu. Tạo ngay trong ô ghi nhanh (ô "Thêm") hoặc ở Cài đặt → Danh mục. Ẩn được danh mục có sẵn.
- **Nhiều ví:** chạm ô "Tiền đang có" để xem số dư từng ví, thêm ví, chuyển tiền giữa các ví. Chọn ví khi ghi giao dịch. Chốt sổ theo từng ví.
- **Cài lên màn hình chính (PWA):** mở như app riêng, dùng được khi mất mạng, có lối tắt "Ghi giao dịch".
- **Nhắc ghi chép mỗi tối** qua Google Calendar hoặc ứng dụng Lịch trên iPhone.
- **Sao lưu và chuyển máy:** một file chứa toàn bộ sổ, gửi qua Zalo, AirDrop, email; khôi phục y nguyên trên máy khác.

**Đổi**
- Thanh tab: Tổng quan · Giao dịch · Ngân sách · Kế hoạch. Kế hoạch gồm Khoản cố định và Mục tiêu tiết kiệm.
- Chốt sổ mở từ màn Giao dịch, màn Tiền đang có, hoặc thẻ nhắc trên Tổng quan (tháng trước chưa chốt, 3 ngày cuối tháng).
- Thông báo hiện ở dưới, gần ngón cái; trong ô ghi nhanh không còn che nút Xong.
- Biểu đồ thu chi chỉ hiện khi có từ 2 tháng dữ liệu.
- Số 0 hiện là "0" thay vì "+0", "−0".
- Rút gọn chữ trên toàn app: bỏ các dòng giải thích lặp lại điều đã rõ trên màn hình.
- Trang Cài đặt chia nhóm: Sổ của bạn, Dùng hằng ngày, Sao lưu và chuyển máy, Excel.
- Excel có thêm cột và sheet Ví; tên danh mục lạ được tạo thành danh mục mới.
- Gợi ý "Ghi lại khoản gần đây" không lặp lại khoản cố định.

**Sửa**
- Thiết lập: khoản lương và khoản cố định "đã nhận/đã trả" được ghi thành giao dịch, nên Thu, Chi, Để dành hiện đúng ngay.
- Thiết lập: nếu tiền đang có ít hơn số tính ra, phần chênh lệch thành dòng "Đã chi trước khi ghi sổ" thay vì số dư đầu tháng âm.
- Xuất rồi nhập lại Excel giữ đúng "Còn tiêu được" của tháng bắt đầu giữa chừng.
- Ô khoản cố định lúc thiết lập hiện số đầy đủ khi gõ tắt.

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
