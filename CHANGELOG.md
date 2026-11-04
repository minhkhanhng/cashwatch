# Nhật ký thay đổi

## v0.3.0 · Danh mục riêng, nhiều ví, cài như app · 04/11/2026

**Mới**
- **Danh mục tự tạo:** đặt tên, biểu tượng, màu. Tạo ngay trong ô ghi nhanh (ô "Thêm") hoặc ở Cài đặt → Danh mục. Ẩn được danh mục có sẵn.
- **Màn Tài sản và nhiều ví:** loại ví gồm tiền mặt, ngân hàng, ví điện tử, thẻ tín dụng, sổ tiết kiệm. Chạm một ô trong thẻ Tài sản ròng để xem:
  - thanh cơ cấu Dùng được / Tiết kiệm / Nợ kèm tỉ lệ %;
  - từng nhóm có tổng riêng, chia nhóm con (Ngân hàng, Ví điện tử…), mỗi ví có thanh so sánh;
  - thẻ tín dụng hiện dư nợ và mức đã dùng so với hạn mức (vàng từ 30%, đỏ từ 70%).
  Chi bằng thẻ thì chọn thẻ khi ghi; trả thẻ bằng Chuyển tiền từ ngân hàng sang thẻ. Chốt sổ nhập số thực tế theo từng ví (thẻ nhập dư nợ).
- **Cài lên màn hình chính (PWA):** mở như app riêng, dùng được khi mất mạng, có lối tắt "Ghi giao dịch".
- **Nhắc ghi chép mỗi tối** qua Google Calendar hoặc ứng dụng Lịch trên iPhone.
- **Đăng nhập bằng email và đồng bộ** (cần bật Supabase, xem `docs/dong-bo-supabase.md`):
  - đăng nhập bằng Google, hoặc bằng link gửi qua email; không cần mật khẩu;
  - sổ lưu trên máy trước rồi tự đẩy lên tài khoản, tự tải bản mới khi mở hoặc quay lại app, dùng được khi mất mạng;
  - hai máy cùng sửa thì gộp giao dịch; máy đã có sổ riêng khi đăng nhập được chọn dùng sổ tài khoản hoặc gộp hai sổ;
  - trạng thái "Đã đồng bộ / Đang đồng bộ / Chưa đồng bộ" trên đầu trang.
- **Sao lưu và chuyển máy:** một file chứa toàn bộ sổ, gửi qua Zalo, AirDrop, email; khôi phục y nguyên trên máy khác.

**Đổi**
- **Giao diện mới** theo bảng màu MP076 (navy Midnight Mirage, xanh chanh First Colors of Spring, trắng ngà Praxeti, xanh Nuit Blanche, xanh lá Picture Book Green). Nền trời xanh nhạt, thẻ bo tròn lớn, nút và chip dạng viên thuốc, thẻ Tài sản ròng nền navy, thẻ Mục tiêu nền xanh chanh, nút + tròn xanh chanh, tab đang mở có nền xanh chanh sau biểu tượng. Mọi cặp chữ/nền đạt WCAG AA (≥ 4.5:1) ở cả nền sáng và tối. Biểu tượng app đổi theo màu mới.
- Thanh tab: Tổng quan · Giao dịch · Ngân sách · Kế hoạch. Kế hoạch gồm Khoản cố định và Mục tiêu tiết kiệm.
- Chốt sổ mở từ màn Giao dịch, màn Tiền đang có, hoặc thẻ nhắc trên Tổng quan (tháng trước chưa chốt, 3 ngày cuối tháng).
- Thông báo hiện ở dưới, gần ngón cái; trong ô ghi nhanh không còn che nút Xong.
- Biểu đồ thu chi chỉ hiện khi có từ 2 tháng dữ liệu.
- Số 0 hiện là "0" thay vì "+0", "−0".
- Rút gọn chữ trên toàn app: bỏ các dòng giải thích lặp lại điều đã rõ trên màn hình.
- Trang Cài đặt chia nhóm: Sổ của bạn, Dùng hằng ngày, Sao lưu và chuyển máy, Excel.
- Excel có thêm cột Ví và sheet Ví (loại, số dư, hạn mức); tên danh mục lạ được tạo thành danh mục mới.
- Thẻ Tài sản ròng trên Tổng quan chia thành Dùng được · Tiết kiệm · Nợ.
- Gợi ý "Ghi lại khoản gần đây" không lặp lại khoản cố định.

**Sửa**
- Thiết lập: khoản lương và khoản cố định "đã nhận/đã trả" được ghi thành giao dịch, nên Thu, Chi, Để dành hiện đúng ngay.
- Thiết lập: nếu tiền đang có ít hơn số tính ra, phần chênh lệch thành dòng "Đã chi trước khi ghi sổ" thay vì số dư đầu tháng âm.
- Xuất rồi nhập lại Excel giữ đúng "Còn tiêu được" của tháng bắt đầu giữa chừng.
- Ô khoản cố định lúc thiết lập hiện số đầy đủ khi gõ tắt.
- Thông báo không có nút (vd "Đã xóa sổ") canh giữa chữ.
- Popup dài (Danh mục, Cài đặt, Ghi nhanh, Kế hoạch…) cuộn được tới cuối; trước đây danh sách bên trong bị ép ngắn và cắt mất phần dưới. Trang phía sau không cuộn theo khi đang mở popup.
- Lối tắt "Xem từng ví" ngay trên thẻ Tài sản ròng; trong Cài đặt đổi tên thành "Tài sản và ví".
- Thử với 5 kiểu người dùng (sinh viên, dân văn phòng nhiều ví, nội trợ, freelancer, người lớn tuổi) và sửa:
  - "mẹ cho 500k", "lì xì", "hoàn tiền" tự nhận là khoản thu (danh mục mới Được cho, tặng và Hoàn tiền); "dự án", "thù lao" nhận là Kinh doanh;
  - danh mục mới Điện thoại (nạp thẻ, 4G, wifi), không còn bị xếp nhầm vào Nhà ở;
  - khoản cố định và giao dịch thêm tay tự đoán danh mục từ tên nếu chưa chọn;
  - thiết lập bắt buộc nhập số tiền đang có;
  - chuyển tiền vượt số dư ví sẽ hỏi lại; xóa ví nói rõ số dư gộp về ví chính;
  - xem giao dịch của riêng một ví (Sửa ví → Xem giao dịch), có thanh lọc và nút Bỏ lọc;
  - chip chọn cao 40px, ô tích 44px, bảng trượt có tên cho trình đọc màn hình;
  - chữ phóng to/màn rất hẹp: ô tài sản xếp dọc, nhãn trạng thái tự xuống dòng;
  - khoản chờ xác nhận gọn hơn ở màn hẹp, ô tìm kiếm không bị cắt chữ, ẩn hàng chọn tháng khi mới có một tháng.
- Dòng điều chỉnh số dư không còn bị tính vào chi tiêu theo danh mục.
- Thanh tab: nút + nằm gọn trong thanh và cùng đường tâm với các nút khác, các cột cách đều, nhãn không dính nhau ở màn hẹp.
- Màn hẹp (320px): số tiền không còn bị bẻ giữa chừng, tiêu đề dài xuống tối đa 2 dòng thay vì bị cắt.

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
