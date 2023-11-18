# MVC

- Model: Đại diện cho một tập hợp các lớp mô tả business logic (business model
  và data model).
- View: Đại diện cho các thành phần UI
- Controller: Có trách nhiệm xử lý các yêu cầu (request) được gửi đến.

## Ưu điểm của MVC Pattern:

1. Tách Biệt Các Phần:
   MVC tách biệt mô hình dữ liệu (Model), giao diện người dùng (View), và logic
   điều khiển (Controller), giúp dễ dàng quản lý và bảo trì mã nguồn.

2. Dễ Kiểm Thử:
   Các thành phần được tách rời làm cho việc kiểm thử trở nên dễ dàng hơn. Bạn
   có thể kiểm thử mô hình, giao diện người dùng và logic điều khiển một cách
   độc lập.

3. Dễ Mở Rộng:
   Do có sự phân tách giữa các phần, việc mở rộng chức năng của ứng dụng trở nên
   dễ dàng hơn mà không làm ảnh hưởng đến các thành phần khác.

4. Tính Tương Thích:
   Có khả năng tái sử dụng các thành phần, điều này làm cho mã nguồn trở nên dễ
   đọc và duy trì.

## Nhược Điểm của MVC Pattern:

1. Phức Tạp:
   MVC có thể trở nên phức tạp khi ứng dụng lớn và phức tạp, đặc biệt là khi có
   sự giao thiệp phức tạp giữa các thành phần.

2. Tăng Cường Độ Kết Nối:
   Controller phải duy trì liên kết giữa Model và View, điều này có thể tạo ra
   sự phụ thuộc mạnh mẽ giữa các phần.

3. Khả Năng Thừa Kế:
   Sự thừa kế giữa các lớp có thể trở nên phức tạp và khó hiểu khi áp dụng MVC.

4. Khả Năng Hiệu Suất:
   Trong một số trường hợp, có thể xuất hiện vấn đề về hiệu suất khi cần phải
   thông qua Controller để truy cập dữ liệu từ Model.


## => Kết luật: Dễ triển khai dễ đọc hiểu phù hợp với các dự án nhỏ có độ phức tạp thấp.

## package support: mvc_pattern, momentum