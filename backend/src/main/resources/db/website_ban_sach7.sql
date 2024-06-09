-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2024 at 08:57 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website_ban_sach7`
--

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id` bigint NOT NULL,
  `gia` decimal(38,2) DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `don_hang_id` bigint DEFAULT NULL,
  `sach_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_gio_hang`
--

CREATE TABLE `chi_tiet_gio_hang` (
  `id` bigint NOT NULL,
  `so_luong` int DEFAULT NULL,
  `sach_id` bigint DEFAULT NULL,
  `tai_khoan_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` bigint NOT NULL,
  `ten_danh_muc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `ten_danh_muc`) VALUES
(2, 'Tham khảo'),
(3, 'Thiếu nhi'),
(4, 'Việt Nam'),
(5, 'Tiểu thuyết'),
(6, 'Truyện ngắn'),
(7, 'Thơ'),
(8, 'Đương đại');

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

CREATE TABLE `don_hang` (
  `id` bigint NOT NULL,
  `da_thanh_toan` bit(1) DEFAULT NULL,
  `dia_chi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_dat_hang` datetime(6) DEFAULT NULL,
  `so_dien_thoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ten_nguoi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tong_tien` decimal(38,2) DEFAULT NULL,
  `tai_khoan_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint NOT NULL,
  `ngay_feedback` datetime(6) DEFAULT NULL,
  `noi_dung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_sao` int DEFAULT NULL,
  `sach_id` bigint DEFAULT NULL,
  `tai_khoan_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sach`
--

CREATE TABLE `sach` (
  `id` bigint NOT NULL,
  `gia` decimal(38,2) DEFAULT NULL,
  `mo_ta` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `photourl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `tieu_de` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `danh_muc_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sach`
--

INSERT INTO `sach` (`id`, `gia`, `mo_ta`, `ngay_tao`, `photourl`, `so_luong`, `tieu_de`, `danh_muc_id`) VALUES
(124, '149000.00', '\"“Các cụ xưa nay vẫn cho rằng ở đời có ba việc lớn là cưới vợ, xây nhà, tậu trâu (trâu đây là sự nghiệp, vì nghiệp xưa của các cụ vốn gắn liền với trâu). Có người thì định nghĩa ‘Hạnh phúc là sáng muốn đi làm, chiều thì muốn về nhà.’ Đủ hiểu hạnh phúc hay bất hạnh ở đời cũng chỉ loanh quanh ba cái điều ấy thôi. \"', NULL, 'txnv.jpg', 496, 'Tật xấu người Việt', 2),
(249, '120000.00', '\"Thế nào là ăn dặm không nước mắt? Là khi con không khóc vì bị ép ăn và mẹ không khóc vì con bỏ bữa. Là khi con hào hứng trước mỗi bữa ăn và mẹ hạnh phúc thấy con ăn hết phần đồ ăn mẹ làm.  Cuốn sách Ăn dặm không nước mắt của mẹ Xoài, một người mẹ Việt nuôi con ở Nhật hẳn sẽ mang đến nhiều gợi ý. Học hỏi các bà mẹ Nhật, mẹ Xoài đã cố gắng tập cho bé Xoài thói quen ăn uống tự giác, tập trung. Mẹ Xoài cũng tôn trọng sở thích, nhu cầu và mong muốn của bé. Còn để khiến bé háu ăn và ăn được nhiều hơn, mẹ Xoài đã chế biến các món ăn thật ngon lành, đa dạng, trang trí vô cùng đẹp mắt để bé chỉ nhìn thôi đã thèm.\"', NULL, 'adknm.jpg', 500, 'Ăn dặm không nước mắt (TB 2023)', 2),
(250, '99000.00', '\"“Trong quá trình khám chữa bệnh, tôi gặp nhiều trường hợp các em bé bị suy dinh dưỡng, còi xương không phải vì gia đình không có điều kiện mà do… quá có điều kiện. Tôi gặp những em bé khá bụ bẫm nhưng bố mẹ vẫn đưa đi khám vì thấy con không tăng cân và cho là con biếng ăn. Trong khi đó cũng có những trường hợp bố mẹ nói rằng con ăn rất được nhưng thực ra khẩu phần dinh dưỡng lại không đủ hoặc không cân đối. Nhưng biếng ăn là câu chuyện tôi gặp nhiều nhất. Chưa bao giờ câu chuyện cho bé ăn gì và ăn như thế nào lại khiến các bố mẹ lo lắng nhiều như vậy.\"', NULL, 'stadcm.jpg', 500, 'Sổ tay ăn dặm của mẹ', 2),
(251, '125000.00', '\"Bạn có nuôi chó hoặc mèo? Chắc hẳn là bạn rất thân thiết với người bạn bốn chân ấy. Vậy bạn có hiểu những hành vi, cử chỉ của “boss”? Chẳng hạn, tại sao chó lại vẫy đuôi cả khi vui mừng lẫn khi căng thẳng? Có nên nhìn thẳng vào mắt một con chó đang giận dữ? Những tiếng gừ gừ của mèo có ý nghĩa gì? Tại sao mèo lại khó tính với đồ ăn đến thế?\"', NULL, 'cvmdlkkh.jpg', 500, 'Chó và mèo dưới lăng kính khoa học', 2),
(252, '250000.00', '\"Lịch sử lâu đời hơn hai nghìn năm của nước Việt Nam đã tạo nên những hệ thống quan lại liên tục được cải tổ theo sự vận động của các thời kỳ, các triều đại. Một hiểu biết vừa tổng thể, vừa chi tiết về bộ máy cai trị của xã hội là điều kiện cần thiết để chúng ta hôm nay có thể đọc sử và hiểu sử.\"', NULL, 'tdcqvn.jpg', 500, 'Từ điển chức quan Việt Nam', 2),
(253, '108000.00', '\"Từ 250 triệu năm trước, muỗi đã có mặt trên Trái đất, vậy nhưng chúng chẳng nán lại lâu la gì: vòng đời trung bình của một con muỗi là 30 ngày. Rất đông đúc (3564 loài), có mặt trên khắp các châu lục, chúng giết người vô tội vạ (750 000 người mỗi năm)! Khi chúng vo ve bên tai ta thì không phải chỉ là để quấy rầy giấc khuya của ta, mà còn là để kể cho chúng ta một câu chuyện : câu chuyện về những đường biên giới bị xóa nhòa, về những đột biến không ngừng, về những cuộc chiến đấu để sinh tồn. Và đặc biệt là câu chuyện tay ba giữa muỗi, ký sinh trùng và con mồi (chính là chúng ta).\"', NULL, 'dctclm-klvtch.jpg', 500, 'Địa chính trị của loài muỗi - Khái lược về toàn cầu hóa', 2),
(254, '129000.00', '\"Từ xưa tới nay, con người vẫn luôn tự hỏi thế nào là một đời hạnh phúc? Con người ta nên sống ra sao? Điều gì rạo nên một cuộc sống hạnh phúc? Hạnh phúc tại tâm hay vì đạt được những mục tiêu trong đời? Sẽ tốt hơn nếu chủ động tìm kiếm hạnh phúc hay chủ động né tránh những điều khiến ta không hạnh phúc? Có người dành cả đời mải miết đi tìm câu trả lời cho những câu hỏi này, và vì một lẽ nào đó chỉ luôn nhận lại thất vọng. Vì sao ư? Phải chăng vì họ cứ kiếm tìm một nguyên tắc duy nhất, một nguyên lý duy nhất, một quy luật duy nhất, trong khi chén thánh đó của cuộc sống hạnh phúc đâu có tồn tại.\"', NULL, 'ntshpgtc.jpg', 500, 'Nghệ thuật sống hạnh phúc gặt thành công', 2),
(255, '149000.00', 'Mong muốn được sống tử tế và sống có ích là điều then chốt tạo nên một cuộc sống hạnh phúc cho bạn trong tương lai. Các nhà lãnh đạo tự cổ chí kim đều mang trong mình những tố chất khơi gợi cảm hứng ấy và truyền cho bạn động lực bước lên những nấc thang mới.', NULL, 'nvnttg-cltll.jpg', 500, 'Nhân vật nổi tiếng thế giới– Các lãnh tụ lẫy lừng', 2),
(256, '88000.00', 'Hạnh phúc thực ra là gì? Công thức nào tạo ra hạnh phúc?', NULL, 'cthp.jpg', 500, 'Công thức hạnh phúc', 2),
(257, '118000.00', '\"Nên rửa tay trước hay sau khi đi vệ sinh, đá lạnh có thể giúp giảm cân, ôm giúp cắt cơn đói, tiểu đứng hay tiểu ngồi có lợi, đạp xe nhiều làm giảm nhu cầu tình dục,...? Bằng cách cung cấp những quy tắc vệ sinh đáng ngạc nhiên, những cách cắt cơn đói tự nhiên, danh sách những loại thực phẩm chống tăng cân,... \"', NULL, 'skkrr.jpg', 500, 'Sống khỏe không rủi ro', 2),
(258, '108000.00', '\"Lịch lãm luôn là yếu tố tiên quyết tạo nên sức hấp dẫn cho phái mạnh. Với tất cả những ai đang loay hoay tìm kiếm phong cách, hoặc xây dựng hình ảnh người đàn ông hiện đại, thành công và thu hút, \"', NULL, 'llnmqo.jpg', 500, 'Lịch lãm như một quý ông', 2),
(259, '149000.00', 'Các hoạt động nghệ thuật và văn hóa giúp chúng ta giải tỏa căng thẳng trong cuộc sống và còn từng bước vun đắp tâm hồn ta.', NULL, 'nvnttg-vhvnt.jpg', 500, 'Nhân vật nổi tiếng thế giới – Văn hóa và nghệ thuật', 2),
(260, '149000.00', '\"Nhắc đến khoa học, hẳn chúng ta sẽ nghĩ ngay đến kiến thức. Nhưng cuốn sách này không chỉ chứa những kiến thức khô cứng. Sách mở ra cho bạn thấy nhân sinh quan tươi sáng và tinh thần vươn lên của các vĩ nhân, sách còn kể lại những trải nghiệm xây đắp nên sự vĩ đại của họ.\"', NULL, 'nvnttg-khvpm.jpg', 500, 'Nhân vật nổi tiếng thế giới – Khoa học và phát minh', 2),
(261, '82000.00', 'Bác sĩ', NULL, 'stmb.jpg', 500, 'Sổ tay mẹ bầu ( TB 2019)', 2),
(262, '69000.00', '\"Để dẫn dắt TÂM vượt qua chướng ngại trên con đường đi tới giác ngộ, con người cần gì? Những bài pháp thoại của Đại ni sư Jetsunma Tenzin Palermo, người từng  có 12 năm thiền định trong hang núi, giúp soi tỏ theo một cách hiếm thấy. Bởi vì hiểu được bản thân mình như một đối tượng khách quan không phải điều dễ dàng, và bậc thầy, từ sự chứng nghiệm của bản thân, đãmở lòng cầm tay dẫn lối. TÂM có thể đạt tới yên tĩnh, tỉnh giác, có thể được trong veo trở lại như mặt hồ phản ánh bầu trời xanh, được khai mở dần như những cánh hoa mở ra vẻ đẹp sâu thẳm. TÂM cần được hiểu và luyện tập đúng đắn để mở đường cho sự chứng nghiệm giác ngộ.\"', NULL, 'bbpt.jpg', 500, 'Ba bài pháp thoại', 2),
(263, '118000.00', '\"Chính trị  là một trong những chủ đề người ta hạn chế đề cập đến trong những cuộc nói chuyện lịch sự, có phải vì các quan điểm chính trị khác nhau dễ gây tranh cãi ? Nhưng nếu bạn muốn hiểu về thế giới xung quanh, bạn phải hiểu về chính trị. Chính trị là cách bất kỳ nhóm người nào quyết định cách điều hành một nhóm, một thành phố, một đất nước hay một lục địa. Chính trị là cách đưa ra các quyết định: nhỏ bé như quyết định ai là lớp trưởng; to tát như bỏ phiếu bầu đại biểu quốc hội hay Chủ tịch nước. Chính trị ở khắp mọi nơi và sớm muộn gì, chúng ta cũng sẽ là một phần của chính trị.\"', NULL, 'lsctcttn.jpg', 500, 'Lịch sử chính trị cho thanh thiếu niên', 2),
(264, '100000.00', '\"Có cha mẹ nào không muốn con mình trở thành những đứa trẻ biết tự học, tự phục vụ bản thân, tự tin, tự hạnh phúc và có chính kiến. Rất nhiều khi, bí kíp không nằm ở việc bố mẹ phải làm những gì, phải ngồi kèm con học bao lâu, phải trả lời mọi điều con hỏi đến đâu, phải dắt con đến những trung tâm học thêm nào, hay đăng ký cho con tham gia các trại hè kỹ năng tốn kém ra sao. Rất nhiều khi, điều quan trọng lại giản dị đến bất ngờ: không làm gì. Buông.\"', NULL, 'btdcb-gpdctl_mtd.jpg', 500, 'Buông tay để con bay  - Giải pháp để con tự lập & mẹ tự do', 2),
(265, '85000.00', '\"Tình yêu là mù quáng! Tây ta đều nói \"\"Love is blind\"\". Đúng vậy! Tình yêu là mù quáng chính vì thế nên bây giờ Lê Bích đã hiểu vì sao yêu nhau người ta cứ phải sờ soạng mới hiểu được nhau để rồi sau đó hôn nhân sẽ làm họ sáng mắt ra.\"', NULL, 'dttystv.jpg', 500, 'Dịch từ tiếng yêu sang tiếng việt ( TB 2019)', 2),
(266, '85000.00', 'Cuốn', NULL, 'ttktl3.jpg', 500, 'Thủ thỉ kiến thức lớp 3', 2),
(267, '105000.00', '\"Được trông đợi ngay từ khi còn là bản thảo, cuốn sách \"', NULL, 'nkhlb.jpg', 500, 'Nhật ký học làm bánh (tập 1)', 2),
(268, '138000.00', '\"Trong đời sống tinh thần của người Việt, niềm tin tâm linh có vai trò vô cùng quan trọng và là biểu hiện sinh động của văn hóa Việt. Tín ngưỡng không chỉ giúp xoa dịu nỗi đau và thiệt thòi của số phận, mà còn động viên, dẫn dắt mỗi kiếp người không ngừng hướng thiện, vượt khó vươn lên trong cuộc sống. Trong các tín ngưỡng ở Việt Nam, Tín ngưỡng thờ Mẫu Tứ phủ là tín ngưỡng nội sinh mang bản sắc Việt. Trải bao thăng trầm và có lúc bị cấm đoán, Tín ngưỡng vẫn âm thầm được gìn giữ, thực hành trong một cộng đồng dân tộc. Ngày nay, tín ngưỡng ấy đã trở thành một trong những biểu tượng của văn hóa Việt cũng và di sản văn hóa phi vật thể của nhân loại.\"', NULL, 'tntmtp-ctnct.jpg', 500, 'Tín ngưỡng thờ Mẫu Tứ phủ - Chốn thiêng nơi cõi thực (TB 2019)', 2),
(269, '88000.00', 'Cuốn', NULL, 'ttktl4.jpg', 500, 'Thủ thỉ kiến thức lớp 4', 2),
(270, '95000.00', '\"Cuộc đời tác giả Ahn Min Jung bắt đầu thay đổi từ khi gặp người chồng Trung Quốc giỏi tiếng Nhật. Sau nhiều thăng trầm và đi tới kết hôn, cô đã sinh được một bé gái xinh đẹp tên là Lena và bắt đầu nuôi dạy con ở Nhật. Cuốn sách này kể lại hành trình nuôi dạy con mà người mẹ Hàn đích thân trải nghiệm trong quá trình nuôi dạy con gái tại Nhật, được trình bày với sự quan sát và văn phong báo chí đặc trưng của một phóng viên. Những bài tiểu luận dựa trên kinh nghiệm có thực của gia đình\"', NULL, 'smcnmn.jpg', 500, 'Sức mạnh của người mẹ Nhật', 2),
(271, '120000.00', '\"Tarot – bộ môn vừa mang màu sắc chiêm đoán vừa mang tính nghệ thuật. Mỗi lá bài đem đến cho bạn những thông điệp được ẩn giấu từ quá khứ, hiện tại hoặc tương lai. Từng lá bài giống như một “bảo tàng nghệ thuật” thu nhỏ – từng bức tranh được gửi gắm trong đó đều chứa những thông điệp về nhân sinh quan.\"', NULL, 'tnm.jpg', 500, 'Tarot nhập môn', 2),
(272, '300000.00', 'Hướng dẫn đơn giản nhất và trực quan nhất từ trước đến nay về thức ăn và dinh dưỡng!', NULL, 'hfw-hhvta.jpg', 500, 'How Food Works - Hiểu hết về thức ăn', 2),
(273, '85000.00', '\"Có thể toán là nhạt nhẽo và không hề đặc sắc với những người không sẵn sàng hiểu nó, nhưng với những người còn lại, toán là nơi mà phép màu và điều kỳ diệu tồn tại trong hình hài của những con số và phương trình, trong những lý thuyết và công thức. Toán đem đến sự tươi mới cho thế giới bình thường này và biến một tình huống tẻ nhạt trở thành niềm vui bất tận đến không thể tin được.\"', NULL, 'cs-thsh.jpg', 500, 'Cool Series - Toán học siêu hay', 2),
(274, '108000.00', '\"Khi con bước vào tuổi dậy thì ẩm ương, dở trẻ con dở người lớn, thì cũng là lúc nhiều cha mẹ thường xuyên ở trong trạng thái bối rối, lo âu, thậm chí tăng xông, sốc nặng. Tại sao con bỗng nhiên ngang như cua? Tại sao con tức giận bừng bừng chỉ vì một lý do bé tí? Tại sao con thích một mình? Tại sao con lơ là gia đình mà thân thiết với bạn bè? Tại sao con ăn mặc không giống ai? Tại sao con yêu bạn khác giới? Tại sao con tò mò về sex? Có 1001 các vấn đề của tuổi teen nhưng hình như ngoài chuyện học hành ra, cha mẹ không mấy quan tâm.  Nhưng nếu cha mẹ biết đứa trẻ cảm thấy cô đơn, không được chia sẻ, căng thẳng và thậm chí tổn thương đến thế nào…\"', NULL, 'ccdqtt.jpg', 500, 'Cùng con đi qua tuổi teen', 2),
(275, '75000.00', '\"Khi trẻ đã lên 6, các bậc cha mẹ tưởng như được dễ thở hơn bởi không còn phải đối mặt với những trận ăn vạ, những cơn gào khóc nhưng thay vì thế thì: chạy nhảy khắp nơi, quên đồ đạc, không tập trung nổi, mất lòng tin, nổi khùng lên trước một việc nhỏ nhặt, hung hăng khi ở trường, khó chịu nơi bàn ăn, tè dầm ra giường,… - Những thử thách mới trong một chặng đường mới! Và liệu những la hét, quát mắng hay hình phạt có phải là giải pháp hay chỉ càng đổ thêm dầu vào lửa?\"', NULL, 'cptcd.jpg', 500, 'Có phải tại con đâu!', 2),
(276, '109000.00', '', NULL, '10kqkttg.jpg', 500, '10 Kỳ quan kiến trúc thế giới', 2),
(277, '109000.00', '', NULL, '10btdnlshh.jpg', 500, '10 bức tranh đẹp nhất lịch sử hội họa', 2),
(278, '90000.00', '\"Tiếng Anh – thứ ngôn ngữ quốc tế - có vẻ như chưa bao giờ dễ tiếp cận đến thế. Ngày nay, với những trung tâm tiếng Anh mọc nên như nấm, chưa nói Internet ở mọi nơi, với vô số ứng dụng trên điện thoại phục vụ cho việc học thức ngôn ngữ này, tưởng chừng chinh phục nó sẽ là điều không quá khó nhọc.\"', NULL, 'qgidmvs.jpg', 500, 'Quẳng gánh Ielts đi mà vui sống!', 2),
(279, '115000.00', '- Giáo dục trẻ tự định hướng/tự chỉ huy thực sự là gì?', NULL, 'gdttdh.jpg', 500, 'Giáo dục trẻ tự định hướng', 2),
(280, '110000.00', '\"Không có độ tuổi nào gây nhiều bối rối hơn tuổi mới lớn. Bối rối không chỉ cho chính những đứa trẻ đang trải qua độ tuổi ấy, mà còn cho những người xung quanh chúng, trên hết là các bậc cha mẹ. Những đứa con hôm qua còn là đứa trẻ vui vẻ, cởi mở, tự giác giúp đỡ cha mẹ việc nhà, hôm nay đã trở thành những cô cậu thiếu niên hay cáu gắt, sưng sỉa, không thiết động chân tay làm một việc gì mà chỉ biết đấu khẩu hoặc né tránh cha mẹ. Những người cha người mẹ hoang mang có thể sẽ tìm thấy sức mạnh cho mình từ cuốn cẩm nang về trẻ tuổi teen thời đại mới này của Anthony E. Wolf.\"', NULL, 'dccyncccct.jpg', 500, 'Để cho con yên nhưng cứ chuyển cho con tiền', 2),
(281, '129000.00', '\"Chế độ dinh dưỡng thời kỳ thai nghén và sau sinh luôn là mối quan tâm lớn của các bà mẹ. Bây giờ mẹ bầu và mẹ cho con bú đã ăn uống thoải mái hơn, không kiêng khem nhiều như xưa, nhưng ăn thế nào cho lành mạnh, đủ dưỡng chất, ngon miệng mà không biến mẹ trở thành “vĩ đại”, lại chế biến đơn giản, thì không phải ai cũng nắm được.\"', NULL, 'man_ckm.jpg', 500, '\"Mẹ ăn ngon, con khỏe mạnh\"', 2),
(282, '179000.00', '\"“Tất cả những công thức trong cuốn sách này được biên soạn với tiêu chí: không cần nhiều kĩ năng hay dụng cụ bếp đặc biệt, nguyên liệu không quá khó tìm, cách thực hiện đơn giản, ngay cả người ‘mới nhất’ trong bếp cũng có thể làm thành công trong lần thử đầu tiên. Và quan trọng hơn hết là tất cả những món ngọt này đều không cần lò nướng. Ý tưởng ‘khi bếp vắng lò’ xuất phát từ rất nhiều phản hồi của bạn đọc \"', NULL, 'nkhlb3-kbvl.jpg', 500, 'Nhật ký học làm bánh 3 - Khi bếp vắng lò', 2),
(283, '89000.00', '\"“Tôi ép con học cũng chỉ là vì nó, sao nó nỡ bỏ đi?”\"', NULL, '72dcnvc.jpg', 500, '72 điều chớ nói với con', 2),
(284, '130000.00', '\"Bạn có biết trong các loàicá mập trắng, linh cẩu và cá sấu, loài nào có hàm răng khỏe nhất? Bạn có biết giun dây giày có thể dài đến 60 mét, đủ để buộc hàng chục đôi giày và người phụ nữ thấp nhất chỉ caocó 61 xăng ti mét? Luôn chứa đựng biết bao điều kỳ thú, thế giới tự nhiên muôn hình muôn vẻ vì thế lúc nào cũng khơi gợi sự hiếu kỳ, say mê khám phá của con người.\"', NULL, 'ckltg-bbktl.jpg', 500, 'Các kỷ lục thế giới - Bộ Bách khoa thư Larousse', 2),
(285, '86000.00', '\"“Đây là một cuốn sách hấp dẫn và bổ ích, nhất là những thông tin về chăm sóc sức khỏe hay ăn uống cho bé. Tôi  nghĩ đây sẽ là một cuốn sách có ích cho các ông bố bà mẹ, và nhất là cho các ông bà nội ngoại của các em bé. Trên hết, cuốn sách sẽ rất cần cho các bác sỹ nhi khoa (và cả sản khoa) ở Việt Nam đọc để thay đổi cách suy nghĩ  và tư vấn cho các ông bố bà mẹ ở Việt Nam.”\"', NULL, 'clkq.jpg', 500, 'Con là khách quý', 2),
(286, '110000.00', '\"\"\"Quá trình tự học làm mỹ phẩm của chúng tôi chắc không được coi là vô cùng suôn sẻ. Không có tài liệu nào bằng tiếng Việt. Không đủ tiền mua nguyên vật liệu... Cũng vì vậy mà tôi đã làm hỏng nhiều và những bài học đó tôi nhớ sâu sắc chúng tôi làm ra cuốn sách này cũng vì muốn bạn có một quá trình học làm mĩ phẩm thuận lợi hơn... Các công thức trong sách hướng dẫn này đã vượt qua bài kiểm tra về độ kích ứng trên da tại Trung tâm Kiểm nghiệm Dược phẩm - Mỹ phẩm Hà Nội.\"', NULL, 'tlmp.jpg', 500, 'Tự làm mỹ phẩm (TB 110.000)', 2),
(287, '138000.00', '\"Nhắc đến “sinh tồn”, bạn sẽ nghĩ đến điều gì? Phiêu lưu trên đảo không người, thám hiểm trong rừng thẳm… nghe thật xa lạ với đời sống hiện đại nhỉ!\"', NULL, 'stnhd.jpg', 500, 'Sinh tồn nơi hoang dã', 2),
(288, '209000.00', '\"Được coi như cuốn sách lớn nhất của một trong những sử gia lớn nhất thời hiện đại, \"', NULL, 'nnkplstkvvvcn.jpg', 500, 'Những nhà khám phá lịch sử tri kiến vạn vật và con người', 2),
(289, '148000.00', '\"Hằng ngày, trên khắp thế giới có hàng triệu bạn trẻ cùng chạy theo trái bóng. Nhìn vào những bạn ấy, ta sẽ hiểu rằng cầu thủ càng giỏi thì càng giàu tình yêu bóng đá. Chính nhờ tình yêu này, người ta hăng say luyện tập kiên trì để cải thiện những điểm còn yếu. Cầu thủ chưa xuất sắc thì cần nỗ lực luyện tập hơn người khác nhiều lần và dần dà sẽ phát huy được hết khả năng của mình.\"', NULL, 'lbvbd.jpg', 500, 'Làm bạn với bóng đá', 2),
(290, '118000.00', '\"Mọi người đều mắc sai lầm. Những sai lầm trong việc ra quyết định đều bắt nguồn từ các lỗi tư duy tưởng như đơn giản, nhưng dần dà chúng tích tụ thành những thành kiến khó bỏ. Vậy mà hiếm khi chúng ta nhận ra điều đó, nên sai lầm cứ nối tiếp sai lầm, dẫn đến bao hối tiếc vì những quyết định không đúng cho cuộc đời mình: Cứ mãi đeo bám một công việc dù biết trước chẳng thu được lợi lộc gì; cho rằng một dự án thành công suôn sẻ là do tài năng và trí lực, còn thất bại do ngoại cảnh khách quan; bán cổ phiếu lúc đã quá trễ, hoặc bán quá sớm… Và đó chỉ là một vài trong số hàng loạt các sai lầm “cơ bản” được Dobelli mổ xẻ phân tích qua 99 chương sách ngắn gọn, súc tích với những ví dụ minh họa thiết thực giúp ta có thể nhận diện và né tránh chúng. Đơn giản, rõ ràng và toàn diện một cách đáng  ngạc nhiên, cuốn cẩm nang nhất định phải có này có thể thay đổi mãi mãi cách ta suy nghĩ, giúp ta quyết định sáng suốt hơn mỗi ngày ở bất cứ đâu,  trong bất cứ tình huống nào.\"', NULL, 'nttdrm.jpg', 500, 'Nghệ thuật tư duy rành mạch', 2),
(291, '148000.00', '\"Bạn thường thấy những nghề nào quanh mình? Thầy cô ở trường, cô chú ở công ty, bác tài xe buýt hay chú lái tàu điện… Nào, giờ bạn thử nghĩ tiếp đến những nghề xa xôi hơn, những cầu thủ bóng đá đại diện cho đất nước đi thi đấu ở nước ngoài, nghệ sĩ trên tivi, phi hành gia… Ngoài ra, còn rất, rất nhiều các công việc khác trên thế giới này.\"', NULL, 'hnntl.jpg', 500, 'Hiểu nghề nghiệp tương lai', 2),
(292, '129000.00', '', NULL, 'nt.jpg', 500, 'Nếu... thì', 2),
(293, '142000.00', '\"Quyển sách này dành cho những ai sợ nước hay chưa biết bơi. Bơi lội là môn thể thao đòi hỏi nhiều công sức để luyện tập cho nhuần nhuyễn, cũng như đi xe đạp vậy. Em có còn nhớ cảm giác xúc động khi lần đầu tiên trèo lên chiếc xe? Hay cảm giác vui sướng khi tự đạp xe chạy băng băng? Thế nhưng những ngày đầu ai cũng phải nhờ người khác giúp, và tập đi tập lại biết bao nhiêu lần mới đạp được, phải không!\"', NULL, 'blnkn.jpg', 500, 'Bơi lội như kình ngư', 2),
(294, '96000.00', '\"Tachikawa Mitsuaki không ngại tiết lộ bí quyết thành công của ông, đó chính là bắt chước. Con người vốn là loài động vật dễ bị ảnh hưởng, dù muốn hay không cũng đang chịu ảnh hưởng từ môi trường và những người xung quanh, đây cũng chính là việc nhân loại thích ứng với môi trường để sinh tồn và phát triển. Nói cách khác, bắt chước cũng chính là học hỏi.\"', NULL, 'bcdtc.jpg', 500, 'Bắt chước để thành công', 2),
(295, '93000.00', '\"Từ một người không có chút kiến thức nào trong ngành bán lẻ, không có kỹ năng đặc biệt hay một chứng chỉ cụ thể nào, thậm chí còn không có cảm xúc về các con số khi bán hàng, Toshifumi Suzuki đã đưa 7-Eleven trở thành đế chế bán lẻ được mệnh danh là chuỗi cửa hàng tiện lợi “đáng sợ” nhất trên thế giới, khi cứ hai giờ đồng hồ trôi qua lại có một cửa hàng mọc lên.\"', NULL, 'tlctbl.jpg', 500, 'Tâm lý chiến trong bán lẻ', 2),
(296, '60000.00', 'Tranh ghép hình được ưa chuộng nhất nước Ý', NULL, 'nbtvbcl-ttgh.jpg', 500, 'Nàng bạch tuyết và bảy chú lùn - Truyện tranh ghép hình', 2),
(297, '116000.00', '\"Nuôi con có phải là một việc dễ dàng? Tiếng khóc giữa đêm của con có bao giờ là niềm vui với các bà mẹ? Tại sao càng dỗ con ngủ, con càng khóc. Bế con cả đêm trên tay mà con vẫn ngủ không yên. Giờ ngủ. Con không ngủ. Giờ ăn. Con không ăn. Người cha người mẹ phải làm gì đây?\"', NULL, 'nck_ccn.jpg', 500, '\"Nuôi con khéo, chăm con nhàn\"', 2),
(298, '150000.00', '', NULL, 'tntbc.jpg', 500, 'Thương nhớ thời bao cấp', 2),
(299, '80000.00', '\"“Độc giả sợ thực phẩm gây ung thư. Còn tôi, tôi hãi truyền thông về an toàn thực phẩm.”\"', NULL, 'dakpbk.jpg', 500, 'Để ăn không phải băn khoăn', 2),
(300, '49000.00', '\"Tuần này bạn đã check in ở bao nhiêu quán? Đã selfie bao nhiêu lần? Lần cuối bạn vào WC mà không mang theo smartphone là từ bao giờ? Nếu bạn thấy cả nguồn sống bỗng chốc thu bé lại vừa bằng một màn hình thì bạn không cô đơn đâu. Internet đã chạm đến mọi ngóc ngách trong cuộc sống của chúng ta. Thế giới đó thật kỳ diệu với nguồn tri thức bất tận, và muôn màu vẻ cuộc sống đang hiện lên từng giây từng phút. Nhưng còn những mặt trái của nó, những những mê cung tăm tối đầy cạm bẫy với đủ loại quái thú, nào spammer, nào troll, hay cả những kẻ ấu dâm đáng sợ?\"', NULL, 'atko.jpg', 500, 'An toàn khi online', 2),
(301, '79000.00', '\"Gần một đời nghề làm việc với trẻ em, gần một đời nghề tiếp xúc với bệnh nhi, làm việc tại Khoa Nhiễm - Thần kinh của Bệnh viện Nhi Đồng 1, nơi “đầu sóng ngọn gió” về dịch bệnh, Bác sĩ Trương Hữu Khanh thấu hiểu những khó khăn, lo lắng và nhiều vấn đề cha mẹ các bé quan tâm và hỏi han trong quá trình chăm sóc con cái. Với mong muốn chia sẻ, giải thích những khúc mắc của  cha mẹ các bé, bác sĩ đã mở fanpage \"', NULL, 'hbsnd_gdtmccmvbcn.jpg', 500, 'Hỏi bác sĩ nhi đồng: Giải đáp thắc mắc của cha mẹ về bệnh con nít', 2),
(404, '75000.00', 'Dành cho lứa tuổi 4+', NULL, 'cgtv-cgttp.jpg', 500, 'Chuyên gia từ vựng - Có gì trong thành phố', 3),
(405, '220000.00', '', NULL, 'ngtg().jpg', 500, 'Nếp gấp thời gian (The Graphic Novel)', 3),
(406, '69000.00', 'MỘT CUỐN SÁCH GÂY ĐỒNG CẢM SÂU SẮC VÀ BUỒN CƯỜI KHÔNG CHỊU ĐƯỢC.', NULL, 'lnl_mdhb.jpg', 500, '\"Làm người lớn, một điều huyền bí\"', 3),
(407, '180000.00', 'Đây là câu chuyện kể về một cô bé mồ côi mười tuổi và một con voi ma mút 10.000 tuổi...', NULL, 'qvb-bhhsmnacdw.jpg', 500, 'Quái vật băng – Bestseller hài hước SỐ MỘT nước Anh của David Walliams', 3),
(408, '45000.00', 'Lời yêu thương', NULL, 'tstcgd-cymvc.jpg', 494, 'Tủ sách tình cảm gia đình - Con yêu mẹ vô cùng', 3),
(409, '75000.00', 'Dành cho lứa tuổi 4+', NULL, 'cgtv-cgosb.jpg', 500, 'Chuyên gia từ vựng - Có gì ở sân bay', 3),
(410, '65000.00', '', NULL, 'gk-lha.jpg', 500, 'Gấu Koda - Làn hơi ấm', 3),
(411, '155000.00', '\" là một hành trình đầy sôi nổi và say mê của 12 họa sĩ trẻ Việt Nam, với 12 truyện ngắn bằng tranh sinh động và giàu sáng tạo. Mỗi câu chuyện là một góc nhìn, có khi huyền ảo, mộng mơ, có khi sâu lắng, day dứt, về một lát cắt đời thường, về một vấn đề xã hội, một sắc màu văn hóa, một góc khuất nội tâm hay một cảm xúc bất ngờ.  \"', NULL, 'cxtt.jpg', 500, 'Cuốc xe tuổi trẻ', 3),
(412, '90000.00', '', NULL, 'ngtg.jpg', 495, 'Nếp gấp thời gian', 3),
(413, '45000.00', 'Cùng gắn kết', NULL, 'tstcgd-cnbn.jpg', 494, 'Tủ sách tình cảm gia đình - Cả nhà bên nhau', 3),
(414, '109000.00', '\"Mầm Lá là cô gà duy nhất trong đàn đến giờ ăn không chúi đầu vào máng mà lại thò cổ qua lưới sắt để ngắm tán cây Mimosa ngoài vườn, cũng là cô gà duy nhất có một cái tên riêng do cô tự đặt. Không chấp nhận cuộc sống quẩn quanh trong chuồng chỉ để xơi cám và đẻ trứng, Ipssac mơ ước được đi lại đó đây, được ấp trứng rồi dẫn bầy con của mình tha thẩn khắp nơi như Gà Mái nhà – thành viên của gia đình sân vườn.\"', NULL, 'cgmxc.jpg', 500, 'Cô gà mái xổng chuồng', 3),
(415, '92000.00', '\"Ngày xưa, trong ngôi nhà trên phố Ai Cập, có một chú  thỏ bằng sứ tên là Edward Tulane. Chú được làm ra bởi một người chế tác đồ chơi bậc thầy, được mặc trên người những bộ quần áo tuyệt hảo đặt may riêng.Chú vô cùng ngưỡng mộ và đề cao bản thân, không màng tới cô chủ Abilene đang vô cùng nâng niu chú. Thế nhưng, trên chuyến đi lênh đênh vượt đại dương, một thằng bé đã vô tình quăng chú khỏi mạn tàu. Và từ đó, hành trình lưu lạc của Edward bắt đầu. \"', NULL, 'cplkdcet.jpg', 500, 'Chuyến phiêu lưu kỳ diệu của Edward Tulane', 3),
(416, '69000.00', 'Gã Mèo lang thang chiếm một khu đất hoang làm nơi nương náu. Chẳng kẻ nào được phép bén mảng vào địa phận của gã.', NULL, 'mltvbcn.jpg', 500, 'Mèo lang thang và Bồ Câu nhí', 3),
(417, '92000.00', 'Sách lật giở song ngữ 0-3 tuổi', NULL, 'lgsn-csn.jpg', 500, 'Lật giở song ngữ - CHIA SẺ NÀO', 3),
(418, '92000.00', 'Sách lật giở song ngữ 0-3 tuổi', NULL, 'lgsn-mmm.jpg', 500, 'Lật giở song ngữ - MĂM MĂM MĂM', 3),
(419, '86000.00', 'Sách lật giở song ngữ 0-3 tuổi', NULL, 'lgsn-mgv.jpg', 500, 'Lật giở song ngữ - MÓN GÌ VẬY', 3),
(420, '86000.00', 'Sách lật giở song ngữ 0-3 tuổi', NULL, 'lgsn-dkn.jpg', 500, 'Lật giở song ngữ - ĐỪNG KHÓC NHÉ', 3),
(421, '86000.00', 'Sách lật giở song ngữ 0-3 tuổi', NULL, 'lgsn-hgt.jpg', 500, 'Lật giở song ngữ - HOA GÌ THẾ', 3),
(422, '86000.00', 'Sách lật giở song ngữ 0-3 tuổi', NULL, 'lgsn-qgd.jpg', 500, 'Lật giở song ngữ - QUẢ GÌ ĐÂY', 3),
(423, '189000.00', '\"Có bao giờ bạn tự hỏi, bánh xe được sáng tạo ra từ khi nào? Hay bạn muốn biết, vào lúc các Pharaoh cho xây dựng các Kim tự tháp ở Ai Cập thì người Ấn Độ đã văn minh đến đâu? Hoặc đơn giản, bạn đã quá ngán những tiết học lịch sử trên lớp, và muốn khám phá cuộc hành trình đến với văn minh của loài người theo một cách trực quan và sinh động, và nhất là… không gây buồn ngủ?\"', NULL, 'lstgtdsk-ttddtthd.jpg', 500, 'Lịch sử thế giới theo dòng sự kiện - Từ thời đồ đá tới thời hiện đại', 3),
(424, '68000.00', 'Dành cho tuổi mẫu giáo và tiểu học', NULL, 'ktcddgbt-qhdn.jpg', 500, 'Kho tàng câu đố dân gian bằng tranh – Quê hương Đất nước', 3),
(425, '68000.00', 'Dành cho tuổi mẫu giáo và tiểu học', NULL, 'ktcddgbt-gdlx.jpg', 500, 'Kho tàng câu đố dân gian bằng tranh – Gia đình Làng xóm', 3),
(426, '85000.00', '', NULL, 'ltdt.jpg', 500, 'Lũ trẻ đường tàu', 3),
(427, '65000.00', '\"Bé Gấu Tuyết đã biết rất nhiều điều: đám cá ngon lành bơi ở đâu, bông tuyết có vị thế nào, gió có thể mơn man mà cũng có thể buốt táp, khi nào mặt trời nhô và khi nào mặt trăng ló. Bé cũng biết nếu ở cách mẹ bao xa thì dễ gặp nguy hiểm. \"', NULL, 'vmycn-bilysm.jpg', 500, 'Vì mẹ yêu con nhiều - Because I love you so much', 3),
(428, '135000.00', 'Học kỹ năng xã hội qua những hoạt động SIÊU VUI!', NULL, 'ptknxh-50hdtvgbnkb_gtvttcknxh.jpg', 500, '\"PHÁT TRIỂN KỸ NĂNG XÃ HỘI - 50 hoạt động thú vị giúp bạn nhỏ kết bạn, giao tiếp và thành thạo các kỹ năng xã hội\"', 3),
(429, '58000.00', '\"Carmen, Carmélito, Bélino và gà Ú đang mải miết chơi thả diều thì một chuyện quái lạ xảy đến khiến tất cả cùng bối rối: xóm gà thân yêu của chúng đã thay hình đổi dạng! Giờ đây không sao vượt qua được tường thành… Thậm chí ông bạn già Pédro còn có vẻ không nhận ra chúng!\"', NULL, 'cxg-qtchd.jpg', 500, 'Chuyện xóm gà – Quả trứng của Hoàng đế', 3),
(430, '58000.00', '\"Còn gì khoái bằng việc được tắm sông sau một trận lội bùn tĩ tã. Nhưng thảm hoạ thay! Con sông chảy qua xóm gà đã mang một màu khác lạ, chưa kể nó còn bốc mùi hôi thối! Carmen, Carmélito và Bélino bèn lội ngược dòng lên thượng nguồn để tìm hiểu vấn đề…\"', NULL, 'cxg-gcdsht.jpg', 500, 'Chuyện xóm gà – Giải cứu dòng sông hôi thối', 3),
(431, '58000.00', '\"Một bà chim lạ vừa từ những hòn đảo xa xôi đến xin tị nạn ở xóm gà. Cháu trai bà, một chú chim sơ sinh bé bỏng, đang phải đối mặt với một nguy hiểm trầm trọng. Chỉ phép mầu mới có thể cứu được chú. Carmen, Carmélito và Bélino, vốn tốt bụng và hào hiệp như thường lệ, sẽ lại lên đường tìm kiếm người duy nhất có thể thực hiện điều kỳ diệu này…\"', NULL, 'cxg-cdbboxg.jpg', 500, 'Chuyện xóm gà – Chim dodo bé bỏng ở xóm gà', 3),
(432, '65000.00', '\" xoáy vào từng khía cạnh nhỏ giúp xây đắp lòng tự tin: cần cù, cải thiện không ngừng, giữ niềm tin vào mình, luyện lòng bao dung, không xem nhẹ bản thân, kiên trì tiến bước… Mỗi câu chuyện là một bài học nhỏ có mô tả nhân vật sinh động, giúp bạn đọc hiểu trực quan và dễ vận dụng cho bản thân mình. 30 câu chuyện về sự tự tin này là nguồn suốt mát lành vun đắp cho những bạn đọc trẻ ngẩng cao đầu yêu thương chính mình.\"', NULL, 'ttkmcxs-nccdtt.jpg', 500, 'Tự tin khiến mình càng xuất sắc - Những câu chuyện để trưởng thành', 3),
(433, '65000.00', '\" gồm gần 30 câu chuyện sinh động về cuộc sống và tinh thần trách nhiệm. Biết gánh vác, chia sẻ, thể hiện yêu thương, vun đắp ước mơ, bỏ qua định kiến, khoan dung, vượt qua thất bại… là những bước nhỏ giúp bạn đọc có trách nhiệm với cuộc đời. Chịu trách nhiệm sẽ giúp mỗi người khỏe mạnh hơn, vững vàng hơn, đủ đầy hơn trong cuộc sống, và hỗ trợ được mọi người xung quanh.\"', NULL, 'mtctn-nccdtt.jpg', 500, 'Mình tự chịu trách nhiệm - Những câu chuyện để trưởng thành', 3),
(434, '65000.00', '\" đào sâu vào các khía cạnh của việc học, làm thế nào vun đắp những kỹ năng tốt hữu ích cho học hành và cả cuộc sống sau này. Sách giới thiệu 30 bài học rõ nét từ những người giỏi giang vươn lên khỏi khó khăn, vững bước trên con đường học hỏi suốt đời, không giới hạn trong học văn, toán, kiến thức mà còn bao gồm đọc sách, học nhạc, học thể thao, học cách vượt lên số phận… “Học, học nữa, học mãi” cũng là một hạnh phúc.\"', NULL, 'cchtt-nccdtt.jpg', 500, 'Chăm chỉ học thành tài - Những câu chuyện để trưởng thành', 3),
(435, '65000.00', '\"Say mê dẫn dắt mình khôn lớn là 30 bài học về những hoàn cảnh khó khăn đi lên bằng say mê, như ngôi sao Leonardo DiCaprio, kỳ tài điện ảnh Quentin Tarantino, ngôi sao bóng rổ Dirk Nowitzki, thiên tài ngôn ngữ mù Alexia Sloane, CEO Chrysler, nhà soạn nhạc Sebatian Bach… Trước khi chạm đến thành công, họ đã đi qua nhiều gian khó bằng chính say mê và nội lực sâu sắc. Những nguồn năng lượng tích cực ấy giúp bạn đọc có thêm niềm tin và mạnh mẽ tiến bước.\"', NULL, 'smddmkl-nccdtt.jpg', 500, 'Say mê dẫn dắt mình khôn lớn - Những câu chuyện để trưởng thành', 3),
(436, '65000.00', '\" gồm 30 câu chuyện truyền cảm hứng vươn lên cho mỗi độc giả nhỏ. Người tạo dựng nên đế chế đồ jean, nhà khoa học nghèo chạm đến cánh cửa Viện Hàn lâm Khoa học Hoàng gia Anh, “chú lính chì” cụt chân vẫn chơi bóng, cậu bé kém cỏi vươn lên dẫn đầu lớp… là những tấm gương sống động, bằng xương bằng thịt, truyền tải sức mạnh phấn chấn cho độc giả. Được tiếp thêm động lực, mỗi người đều có thể trở thành “anh hùng” cho chính cuộc đời mình.\"', NULL, 'smcntg-nccdtt.jpg', 500, 'Sức mạnh của những tấm gương - Những câu chuyện để trưởng thành', 3),
(437, '106000.00', '“Ông Thối Hoắc hôi rình. Thối hoắc thối hoăng. Nếu trong từ điển còn từ nào thối hơn để diễn tả thứ mùi của ông thì xin cứ việc dùng...”', NULL, 'oth-bhhsmnacdw.jpg', 500, 'Ông Thối Hoắc - Bestseller hài hước SỐ MỘT nước Anh của David Walliams', 3),
(438, '58000.00', '\"Khi bị ốm mệt, em đừng lo lắng\"', NULL, 'cslrrvbs.jpg', 500, 'Cuốn sách lớn rực rỡ về bác sĩ', 3),
(439, '58000.00', '\"Nguy hiểm vô cùng, những đám cháy!\"', NULL, 'cslrrvlch.jpg', 500, 'Cuốn sách lớn rực rỡ về lính cứu hỏa', 3),
(440, '62000.00', '', NULL, 'tmgv.jpg', 500, 'Tớ mặc gì vậy', 3),
(441, '62000.00', 'Đoán xem tớ là ai nào!', NULL, 'datn.jpg', 500, 'Đuôi ai thế này', 3),
(442, '108000.00', '', NULL, 'ogk.jpg', 500, 'Ông già Khottabych', 3),
(443, '16000.00', 'SÁCH TÔ MÀU PHÁT TRIỂN NÃO BỘ', NULL, 'tmptnbcb1-5tt5.jpg', 500, 'Tô màu phát triển não bộ cho bé 1-5 tuổi Tập 5', 3),
(444, '65000.00', '\"Ở ngôi làng Bắc Cực có hai mẹ con gấu Koda sống bên nhau yên bình, hạnh phúc. Cho tới một ngày kia, tên thợ săn Vova tới và truy đuổi hai mẹ con...Câu chuyện dịu dàng, cảm động kể về tình cảm mẹ con, sự hi sinh và tha thứ sẽ đem tới nhiều cảm xúc và suy nghĩ cho các độc giả nhỏ tuổi.\"', NULL, 'gk-cmd.jpg', 500, 'Gấu Koda - Cái mũi đen', 3),
(445, '229000.00', '\"Một cuốn sách giải đáp hơn 200 câu hỏi về những cầu thủ, đội bóng nổi tiếng cùng những giải bóng đá và kỷ lục hấp dẫn nhất.\"', NULL, 'hdce-bd.jpg', 500, 'Hỏi đáp cùng em! - Bóng đá!', 3),
(446, '65000.00', 'Nuôi một em mèo trong nhà chẳng phải rất tuyệt sao?', NULL, 'cnmemdk-cihalc.jpg', 500, 'Con nuôi một em mèo được không? - Can I have a little cat? (Sách song ngữ Anh - Việt)', 3),
(447, '229000.00', 'Một cuốn sách giải đáp hơn 200 câu hỏi về những nguồn tài nguyên đáng kinh ngạc của hành tinh chúng ta cùng những hành động tuy nhỏ nhưng có ích để bảo vệ chúng.', NULL, 'hdce-ltndbvtn.jpg', 500, 'Hỏi đáp cùng em! - Làm thế nào để bảo vệ thiên nhiên?', 3),
(448, '65000.00', '\"Một nụ hôn sẽ làm tim cậu đập nhanh hơn, bụng cậu như có bướm bay rộn ràng, lòng cậu ấm áp và cả người cứ râm ran. Một nụ hôn sẽ khiến chân cậu bủn rủn và làm cậu cảm thấy bồng bềnh như đang bay.\"', NULL, 'nhdt-tvfk.jpg', 500, 'Nụ hôn đầu tiên - The very first kiss', 3),
(449, '59000.00', 'Cuốn sách vui nhộn này', NULL, 'btdt-ekns.jpg', 500, 'Bé trai đi toilet - Ehon kỹ năng sống', 3),
(450, '38000.00', '', NULL, 'bynngg-co_xl.jpg', 500, '\"Bé yêu ngoan ngoãn giỏi giang – Cảm ơn, xin lỗi\"', 3),
(451, '59000.00', 'Cuốn sách đáng yêu này', NULL, 'bgdt-ekns.jpg', 500, 'Bé gái đi toilet - Ehon kỹ năng sống', 3),
(452, '145000.00', '', NULL, 'svhkt-ncdthcrvn-bcc_nvnnbk.jpg', 500, '\"Sinh vật học kỳ thú - Những cư dân tí hon của rừng Việt Nam – Bướm, Chuồn chuồn và những người bạn khác\"', 3),
(453, '38000.00', '', NULL, 'bynngg-mtnn.jpg', 500, 'Bé yêu ngoan ngoãn giỏi giang – Mình tự ngủ ngoan', 3),
(454, '165000.00', '', NULL, 'svhkt-ncdthcrvn-b_ccvnnbk.jpg', 500, '\"Sinh vật học kỳ thú - Những cư dân tí hon của rừng Việt Nam - Bọ Cánh Cứng, Nhện và những người bạn khác\"', 3),
(455, '38000.00', '', NULL, 'bynngg-tcgr.jpg', 500, 'Bé yêu ngoan ngoãn giỏi giang – Trồng cây gây rừng', 3),
(456, '38000.00', '', NULL, 'bynngg-hcsc.jpg', 500, 'Bé yêu ngoan ngoãn giỏi giang – Học cách sẻ chia', 3),
(457, '38000.00', '', NULL, 'bynngg-casn.jpg', 500, 'Bé yêu ngoan ngoãn giỏi giang – Cùng ăn sinh nhật', 3),
(458, '168000.00', '\"Năm năm trước, cha của Okutsuki Soushi, pháp sư vĩ đại của Thành phố Thư viện Alexandria, đã bị giết hại dã man trong mê cung ngay trước mắt con trai mình. Sau sự kiện này, Soushi đã bị sang chấn tâm lý, mất đi ký ức và khả năng sử dụng phép thuật. Năm năm sau, ngay trong ngày đầu tiên trở lại Alexandria, cậu đã gặp “High Daylight Walker” Arteria và bị cô ta biến thành ma cà rồng. Kể từ đó, cậu cùng Arteria dấn thân vào Mê cung Thư viện hòng tìm ra kẻ thù đang lẩn trốn, để có thể thoát khỏi nỗi khổ tâm giày vò suốt năm năm, cũng là để hoàn thành ước mơ của mình. Hãy nhớ lấy điều này: bạn phải tìm ra kẻ thù giết cha đang lẩn trốn trong bóng đen của chấn thương tâm lý. Bạn phải lấy lại phép thuật đã mất, phải giành lại danh dự đã bị đánh cắp. Bạn phải làm tất cả những điều đó cùng Arteria, Chân tổ Ma cà rồng. Tác phẩm đầu tay của Sei Toaza, cũng là tác phẩm tiêu biểu đã lọt vào vòng ba giải thưởng dành cho tác giả Light Novel mới lần thứ 10 do MF Bunko J tổ chức.\"', NULL, 'mctv.jpg', 500, 'Mê cung Thư viện', 3),
(459, '38000.00', '', NULL, 'bynngg-cmom.jpg', 500, 'Bé yêu ngoan ngoãn giỏi giang – Chăm mẹ ốm mệt', 3),
(460, '38000.00', '', NULL, 'bynngg-vsct.jpg', 500, 'Bé yêu ngoan ngoãn giỏi giang – Vệ sinh cơ thể', 3),
(461, '55000.00', '', NULL, 'bdtxc.jpg', 500, 'Bố đã từng xa con', 3),
(462, '68000.00', '\"“...Ngày xưa của con giống như một cuốn nhật kí bằng thơ; ghi chép vội vã những câu nói ngây thơ của con , trong nhà, dọc đường đi, những cuộc đối thoại của mẹ- con bên vai nhau, kề má nhau, rủ rỉ suốt ngày không chán và mãi vẫn ngạc nhiên. Đôi từ còn chưa chau truốt nhưng trong sáng ngây thơ như rót mật vào tim. Bất cứ bộ đôi mẹ - con nào cũng có thể cùng nhau đọc lên những bài thơ đó như chuyện tình yêu của mình. Những hình ảnh rung động tận trái tim: “Mẹ nâng thật khẽ Bàn tay trắng xinh Đặt trong tay mình Như bông hoa nhỏ”\"', NULL, 'nxcc.jpg', 500, 'Ngày xưa của con', 3),
(463, '16000.00', 'SÁCH TÔ MÀU PHÁT TRIỂN NÃO BỘ', NULL, 'tmptnbcb1-5tt6.jpg', 500, 'Tô màu phát triển não bộ cho bé 1-5 tuổi Tập 6', 3),
(464, '155000.00', '\"Liều \"\"vitamin vui vẻ\"\" dành cho bạn nhỏ tiểu học và bất cứ ai đam mê tí toáy 2 cuốn sách rực rỡ này tập hợp hơn 200 trò chơi sáng tạo chẳng tốn đồng nào từ những vật dụng em có thể tìm thấy ngay trong nhà hoặc ngoài thiên nhiên. Giải mật mã chơi rối bóng ngâm cứu sao chụp ảnh bầu trời làm tranh từ lá rơi xây khách sạn bọ… những trò vui hấp dẫn vừa kích thích óc sáng tạo vừa giúp em xua tan mọi buồn chán. Sách cũng bày nhiều tuyệt chiêu sáng tạo nghệ thuật ngoài trời để em thêm gần gũi với thiên nhiên và các mẹo tái sử dụng đồ vật để em bảo vệ môi trường bằng những hành động thiết thực!\"', NULL, 'ngb-tttt.jpg', 500, 'NEVER GET BORED - TÍ TA TÍ TOÁY', 3),
(465, '135000.00', 'Tác phẩm hài hước siêu hấp dẫn mới nhất của nhà văn thiếu nhi Anh ăn khách David Walliams.', NULL, 'bdnd.jpg', 500, 'Băng đảng Nửa đêm', 3),
(466, '50000.00', '\"Bộ sách thiết thực này là kết hợp giữa những minh họa trực quan cao độ và chủ đề giáo dục trọng yếu. Tất các cuốn sách trong bộ đều có Phần câu hỏi thảo luận để hỗ trợ phụ huynh khơi gợi và dẫn dắt những cuộc trò chuyện với trẻ về cảm xúc, nỗi lo lắng, thất bại, sự tử tế, bảo vệ thân thể, bình đẳng giới và đa dạng giới,... Bộ sách là công cụ giúp trẻ nói lên tiếng nói của mình và khuyến khích trẻ tham gia chủ động, tích cực vào việc học hỏi.\"', NULL, 'ptttcx-cdlcm.jpg', 500, 'Phát triển trí tuệ cảm xúc - Con được là chính mình!', 3),
(467, '219000.00', '\"3 cuốn tiếp theo trong series Hỏi đáp cùng em trứ danh của NXB Larrouse, nhà xuất bản sách kiến thức thiếu nhi hàng đầu nước Pháp.\"', NULL, 'hdce-tvs.jpg', 500, 'Hỏi đáp cùng em- Thật vậy sao?', 3),
(468, '219000.00', '\"3 cuốn tiếp theo trong series Hỏi đáp cùng em trứ danh của NXB Larrouse, nhà xuất bản sách kiến thức thiếu nhi hàng đầu nước Pháp.\"', NULL, 'hdce-llcchvs.jpg', 500, 'Hỏi đáp cùng em - Lại là các câu hỏi vì sao', 3),
(469, '50000.00', 'PHÁT TRIỂN TRÍ TUỆ CẢM XÚC - hành trang tâm lý vững vàng cho con.', NULL, 'ptttcx-cxccmg.jpg', 500, 'Phát triển trí tuệ cảm xúc- Cảm xúc của con màu gì?', 3),
(470, '219000.00', '\"3 cuốn tiếp theo trong series Hỏi đáp cùng em trứ danh của NXB Larrouse, nhà xuất bản sách kiến thức thiếu nhi hàng đầu nước Pháp.\"', NULL, 'hdce-vvhdtn.jpg', 500, 'Hỏi đáp cùng em -  Vạn vật hoạt động thế nào?', 3),
(471, '119000.00', 'Nhã Nam thiếu nhi | SÁCH TƯƠNG TÁC CHƠI VÀ HỌC', NULL, 'ptkntdpb-l5nc.jpg', 500, 'Phát triển kỹ năng tư duy phản biện – Lớp 5 nâng cao', 3),
(472, '119000.00', 'Nhã Nam thiếu nhi | SÁCH TƯƠNG TÁC CHƠI VÀ HỌC', NULL, 'ptkntdpb-l5.jpg', 500, 'Phát triển kỹ năng tư duy phản biện – Lớp 5', 3),
(473, '169000.00', 'Ngập tràn các hoạt động sáng tạo cho bạn nhỏ 3+.', NULL, 'xstrr-mnnnmbt.jpg', 500, 'Xưởng sáng tạo rộn ràng- Mỗi ngày nắn nót một bức tranh', 3),
(474, '119000.00', 'Nhã Nam thiếu nhi | SÁCH TƯƠNG TÁC CHƠI VÀ HỌC', NULL, 'ptkntdpb-l4.jpg', 500, 'Phát triển kỹ năng tư duy phản biện – Lớp 4', 3),
(526, '159000.00', '\"Con đường hiểm nguy là tập thứ năm trong bộ Mèo chiến binh (2003-2004) của tác giả Erin Hunter. Bộ truyện giành được nhiều phản hồi tích cực, được dịch ra hơn 20 thứ tiếng và có lực lượng người hâm mộ hùng hậu trên khắp thế giới\"', NULL, 'mcb-cdhn.jpg', 498, 'Mèo chiến binh - Con đường hiểm nguy', 4),
(527, '190000.00', '\"Tập truyện đầu tay này của tôi tập hợp những ghi chép rải rạc về tình yêu và ước mơ, những trải nghiệm tự chữa lành sau vụn vỡ, những tâm sự về số phận và hy vọng.\"', NULL, 'ttnllchmv.jpg', 496, 'Trái tim người lớn là con hàu mang vỏ', 4),
(528, '168000.00', '\"Nước Đại Việt triều Lý đời vua Lý Anh Tông xảy ra loạn Thân Lợi. Thân Lợi là một phù thủy cao tay có tài “mê tâm thuật”, có thể làm người ta u mê tinh thần để dễ sai khiến. Với pháp lực bẩm sinh hiếm thấy cộng thêm quá trình tu tập, Thân Lợi trở thành giáo chủ của Xương Cuồng giáo, một tà giáo thờ thần Xương Cuồng, thâu tập những kẻ chuyên luyện tà năng bằng các cách thức man rợ. Nhưng tham vọng của Thân Lợi không dừng ở đó, hắn muốn chính mình trở thành thần Xương Cuồng, để sở hữu quyền năng vô biên. Kẻ nào muốn luyện thành phép này phải tột bậc kỳ công cùng may mắn mới hội đủ các yếu tố. Thân Lợi đã chuẩn bị nhiều năm, và gần như đã có tất cả...\"', NULL, 'ltdt.jpg', 498, 'Lý triều dị truyện', 4),
(529, '75000.00', 'được xem là tập tiếp theo của cuốn', NULL, 'tddl.jpg', 500, 'Tàn đèn dầu lạc', 4),
(530, '75000.00', '\" là tập phóng sự về việc hút thuốc phiện ở Việt Nam hồi đầu thế kỷ 20. Hút thuốc phiện dưới con mắt của Nguyễn Tuân vừa độc hại như một thứ gây nghiện, tàn phá sức khỏe của kẻ hút và làm khốn đốn gia đình, xã hội. Nhưng đồng thời hút thuộc phiện cũng được Nguyễn Tuân mô tả như một thú chơi của giới nghệ sĩ, trí thức, đem đến những cảm xúc thăng hoa trong sáng tạo và công việc.\"', NULL, 'nddl-vndt.jpg', 499, 'Ngọn đèn dầu lạc - Việt Nam danh tác', 4),
(531, '129000.00', '', NULL, 'bhlmts-mmoca.jpg', 500, 'Bất hạnh là một tài sản - Một mình ở Châu Âu', 4),
(532, '120000.00', '\"cuốn sách tập hợp các bài viết thể hiện quan điểm, suy ngẫm của tác giả Nguyễn Ngọc Tiến về lịch sử, văn hóa, xã hội Việt Nam trong quá khứ cũng như trong hiện tại. \"', NULL, 'qdoncvn.jpg', 500, 'Qua đêm ở nhà các vua Nguyễn', 4),
(533, '99000.00', '\"Cuốn sách CÁ HỒI của Tâm Bùi kể về hành trình thay đổi suy nghĩ, lối sống sau khi giác ngộ được những lý lẽ của đạo Phật (thông qua các khóa tu tập tại làng Mai và sự giảng đạo của thiền sư Thích Nhất Hạnh).\"', NULL, 'ch-httt.jpg', 500, 'Cá hồi – Hành trình tỉnh thức', 4),
(534, '88000.00', '', NULL, 'cmpvdqp.jpg', 500, 'Có một phố vừa đi qua phố', 4),
(535, '120000.00', 'Một ghi chép đầy tình yêu thương về hành trình làm bố của nhà báo sắc sảo Phạm Gia Hiền.', NULL, 'bncc.jpg', 500, '\"Bố ngồi cùng con, nhé!\"', 4),
(536, '139000.00', '\"Năm Cảnh Hưng thứ bốn mươi ba, huyện Cốc Dương, trấn Sơn Tây, đêm rằm tháng Bảy. Một gã phù thủy đang lập trận thu nạp âm binh giữa bãi chôn người. Phạm Đình Quyết, dòng dõi của một gia đình chín đời làm nghề khâm liệm đã vô tình chứng kiến cảnh tượng kinh dị này. Từ đây, hắn bắt đầu bước chân vào một thế giới chưa từng biết. Hắn dần dần khám phá ra bí mật của gia đình mình. Và thân phận thực sự của hắn, một Lạc Vu Điện Súy của Trấn Quốc Hội, nơi tập hợp những phù thủy cao tay, những nhà huyền thuật xuất sắc đang âm thầm bảo vệ Đông Kinh trước sự tấn công của giáo phái Hàng Long tà đạo từ ngoại bang.\"', NULL, 'dndt.jpg', 500, 'Đại Nam dị truyện', 4),
(537, '119000.00', '\"Sinh ra ở Moscow bởi bố mẹ người Việt Nam nhưng lại tin rằng mình có phần nào đó là người Xô viết chuyển về Hà Nội khi lên 3 và vào học trường Quốc tế Pháp dưới sự ủng hộ của ông bà 15 tuổi rời Việt Nam sang Mỹ để học tại một trường nội trú ở tiểu bang Connecticut câu hỏi mà Ngọc Nguyễn cũng như những đứa trẻ nhiễu văn hóa khác cảm thấy khó trả lời nhất là \"\"Bạn đến từ đâu?”. Vượt lên trên một cuốn nhật ký cá nhân\"', NULL, 'dtnvh.jpg', 500, 'Đám trẻ nhiễu văn hóa', 4),
(538, '52000.00', '\"\"\"KHI TÔI QUAY LẠI NHÌN CHỒNG NÀNG tôi thấy rõ cái lãnh đạm của người đàn ông ấy... Nàng có sung sướng không? Nàng có còn nhớ đến tôi không? Ngậm ngùi tôi nghĩ đến cuộc ái ân ngắn ngủi...trong mấy tháng hè: cái tình yêu  biết đâu chẳng vẫn còn để lại trong lòng nàng một vẻ rực rỡ như ánh nắng trong vườn.\"\"\"', NULL, 'ntv-vndt.jpg', 500, 'Nắng trong vườn - Việt Nam Danh Tác', 4),
(539, '200000.00', '\"Ở Việt Nam giai đoạn trung đại, nghề nghiệp gắn liền với gia đình, làng xã, địa phương. Mỗi vùng đất có một đặc sản nghề riêng mà tiếng tăm vẫn được truyền đến ngày nay nhờ được lưu truyền trong ca dao cổ. Việc truyền nghề được coi là việc riêng của dòng họ hay địa phương, thậm chí nghề được giữ gìn như bí quyết riêng của gia đình hay dòng họ, ngăn cấm truyền dạy cho người ngoài...\"', NULL, 'tdnovntpt.jpg', 500, 'Trường dạy nghề ở Việt Nam thời Pháp thuộc (1898-1945)', 4),
(540, '58000.00', '\"“… qua một đêm mưa rào, trời bỗng đổi ra gió bấc, rồi cái lạnh ở đâu đến làm cho người ta tưởng đang ở giữa mùa  đông rét mướt. Sơn tung chăn tỉnh dậy, nhưng không bước xuống giường ngay như mọi khi, còn ngồi thu tay vào  trong bọc, bên cạnh đứa em bé vẫn nắm tay ngủ kỹ. Chị Sơn và mẹ Sơn đã trở dậy, đang ngồi quạt hỏa lò để pha nước chè uống. Sơn nhận thấy mọi người đã mặc áo rét cả rồi.”\"', NULL, 'gdm-vndt.jpg', 500, 'Gió đầu mùa - Việt Nam Danh Tác', 4),
(541, '54000.00', '\"\"\" Một sáng tỉnh giấc sau những giấc mơ xáo động Gregor Samsa nằm trên giường nhận thấy mình đã biến thành một con côn trùng khổng lồ. Anh nằm ngửa trên cái lưng rắn như thể được bọc giáp sắt và khi dợm nhấc đầu lên anh nhìn thấy bụng mình khum tròn nâu bóng phân chia làm nhiều đốt cong cứng đờ tấm chăn bong đắp trên bụng đã bị xô lệch gần tuột hẳn. Chân anh nhiều ra mảnh khảnh đến thảm hại so với phần còn lại của thân hình to đùng vung vẩy bất lực trước mắt anh.\"\"\"', NULL, 'ht.jpg', 500, 'HÓA THÂN', 4),
(542, '179000.00', '\"Bản tính của con người được thể hiện thông qua cách chúng ta đối thoại với người khác. Trong bất kỳ trường hợp nào, chúng ta đều có thể lựa chọn thái độ khi trò chuyện. Thông qua thái độ ấy, ta có thể tự mình xây dựng đồng thời cũng có thể tự tay phá hủy các mối quan hệ và phẩm cách bản thân.\"', NULL, 'tslbnlktkv.jpg', 500, 'Tại sao lời bạn nói lại khiến tôi không vui', 4),
(543, '198000.00', '\"Việc biên soạn, sưu tầm các bài ca dao, tục ngữ in thành sách được ghi nhận sớm nhất ở Việt Nam từ khoảng cuối thế kỷ 17. Tuy nhiên điều đáng tiếc là các sách này chỉ sưu tầm được một số lượng bài rất hạn chế, khiến cho nhiều bài ca dao, tục ngữ có nguy cơ bị mai một, thất tán.\"', NULL, 'tnpd.jpg', 500, 'Tục ngữ phong dao', 4),
(544, '116000.00', '\"Không lối thoát không nơi nương tựa với Akari \"\"thần tượng\"\" là lý do em hít thở mỗi ngày là \"\"xương sống\"\" của em. Nhưng thần tượng của em dính \"\"phốt\"\" rồi! Ngọn lửa thị phi ngày càng lan rộng. Thế giới của em từng phần vụn vỡ. Phải làm sao để cứu chính mình? \"', NULL, 'ttctdpr.jpg', 500, 'Thần tượng của tôi dính phốt rồi', 4),
(545, '180000.00', '\"Nhiều năm trước, một cô gái đã tiêu toàn bộ tiền tiết kiệm để đến với Tuần lễ Thời trang Paris, bảy, tám ngày liền ngồi tàu điện ngầm đến các show diễn khác nhau, thường phải đứng cả ngày, lúc nóng lúc lạnh đến nỗi phát sốt. \"', NULL, 'tn-kccccnpntc.jpg', 500, 'Tao nhã - Khí chất cần có của người phụ nữ thành công', 4),
(546, '72000.00', '\"Khi nàng biết cách làm một người đàn bà thực sự, ấy là khi nàng xứng được yêu.\"', NULL, 'mlnhdynhg.jpg', 500, '\"Muốn làm nữ hoàng, đừng yêu như hầu gái\"', 4),
(547, '130000.00', '\"\"\"Thơ của Trần Vàng Sao chính là cuộc đời ông. [...] Thơ ông hiện ra như chính áo quần ông tóc tai ông hơi thở ông ánh mắt ông giọng nói ông cảm giác ông mồ hôi ông đau đớn ông giận dữ ông giày vò ông tuyệt vọng ông khát vọng ông... và nhịp đập trái tim ông là thứ kỳ diệu nhất gắn kết toàn bộ những gì thuộc về ông để vang lên thành thi ca. Bởi thế thơ ông chân thực và mãnh liệt như máu chảy trong huyết quản ông.\"', NULL, 'btcmnynm.jpg', 500, 'Bài thơ của một người yêu nước mình', 4),
(548, '60000.00', '\"“Sau một cái tử biệt, giờ ta phải tính đến một nỗi sinh li khác. Đối với đàn, hát, từ bây giờ ta nguyện làm một người điếc một người cô đơn một người phản bội. Và trên vong linh Bá Nhỡ, ta thề độc là không bao giờ cầm đến một cái chén nào của cuộc đời này.”\"', NULL, 'cd.jpg', 500, 'Chùa Đàn', 4),
(549, '108000.00', 'MẸ là ai?', NULL, 'm-m.jpg', 500, 'Mama - Mẹ', 4),
(550, '90000.00', '\" của Minh Thi, như một-truyện-tình, mơ màng nhưng thật sống động, của một du học sinh đối với nước Anh, xứ sở dù chia tay nhưng đã nằm trọn trong trái tim cô. Ở đó, bạn sẽ được thưởng ngoạn các nghệ sĩ trổ tài ngay trên các đường phố tấp nập của London, lướt qua các quán rượu để nghe tiếng chuyện trò rôm rả và tiếng chạm cốc leng keng vào giờ tan tầm, hay đôi khi dạo chơi thong thả qua những con phố nép mình giữa hai hàng tường đá rêu phong và vùng thôn quê xanh mơ của thành phố Edinburgh cổ kính. Bạn cũng sẽ biết người Anh nghĩ gì, muốn gì, và cần phải cẩn trọng như thế nào để không bị lố khi nói chuyện với họ. \"', NULL, 'tbqtona.jpg', 500, 'Tôi bỏ quên tôi ở nước Anh (TB 2019)', 4),
(551, '88000.00', '\"“Gã đồng nghiệp đưa hẳn cho Zozo năm trăm mười lăm ngàn, không quên nói vọng theo sau lưng anh: ‘Tôi nể ông thật đấy. Vẫn nhớ ngày kỷ niệm yêu nhau sau bảy năm trời, thế mà lại quên mặc quần khi ra đường!’\"', NULL, 'cngt.jpg', 500, 'Cái nồi gì thế?', 4),
(552, '85000.00', '\"“… Nhưng, ở một bình diện quan trọng hơn, thì Dân Trí được nâng cao cũng là nền tảng giúp bảo đảm sự Công bằng trong xã hội và tinh thần Dân chủ trong chính trị nhằm mở rộng hơn nữa cánh cửa Tự do của tư duy. Dân trí được nâng cao thì cũng phong phú hoá đời sống người dân về khía cạnh Văn hoá và Nhân văn, giúp thăng hoa con người một cách cân bằng hơn.\"', NULL, 'cucvndcbkddhhk.jpg', 500, 'California Universities & colleges và những điều cần biết khi đi du học Hoa Kỳ', 4),
(553, '88000.00', '', NULL, 'cntoxt.jpg', 500, 'Chuyện người Tây ở xứ ta', 4),
(554, '86000.00', '\"Nhắc đến thành tựu truyện ngắn đương đại mà không kể đến Trần Vũ là một thiếu sót lớn. Đặc trưng của tác giả là những câu chữ hoặc đau đớn đến tan nát, hoặc táo bạo, lạnh lùng đến sắc rợn; các thủ pháp lạ hóa, biến đổi hiện thực, huyền ảo được tận dụng tối đa để khai phá mối tương quan giữa lịch sử, hiện thực, bạo lực và tình dục. Văn của Trần Vũ khước từ sự lưng chừng, mơ hồ, luôn đẩy sức căng đến những góc cạnh cực đoan nhất và tìm thấy con người hoặc ở nơi sâu thẳm, hoặc chốn man rợ khốn cùng.\"', NULL, 'ptcmns.jpg', 500, 'Phép tính của một nho sĩ', 4);
INSERT INTO `sach` (`id`, `gia`, `mo_ta`, `ngay_tao`, `photourl`, `so_luong`, `tieu_de`, `danh_muc_id`) VALUES
(555, '79000.00', '\"Ngay cả những cánh bồ công anh đang nương theo cơn gió của mình cũng có hành trình riêng của chúng. Tớ hay đằng ấy, mỗ người trong chúng a đều có một con đường. Số phận đặt  chúng ta lên con đường đó, nhưng đi đến đâu làm được gì là việc của mỗi người. Đây chưa phải là điểm dừng của đằng ấy đâu. Hãy đi theo cơn gió của mình đi.\"', NULL, 'qtdchtnm.jpg', 500, 'Quá trẻ để chết : Hành trình nước Mỹ ( TB 2019)', 4),
(556, '77000.00', '\"Trong cuốn sách này, Giáo sư Nguyễn Quang Riệu, nhà khoa học danh tiếng, nhà vật lý thiên văn có đóng góp đáng kể trong lĩnh vực vật lý thiên văn vô tuyến của thế giới trong những năm 1970, đã giúp các bạn đọc trẻ có được vốn hiểu biết cơ bản về vũ trụ: những người cổ đại, từ Ai Cập, Babylon, Hy Lạp đến Trung Hoa có quan niệm thế nào về vũ trụ, vũ trụ ẩn hiện trong văn hóa dân gian Việt Nam ra sao, rồi cũng vũ trụ ấy được nhìn từ phương diện khoa học: nguồn gốc và sự hình thành vũ trụ, trong đó có dải Ngân hà và hệ Mặt Trời, nơi chúng ta đang sống…\"', NULL, 'snktkm.jpg', 500, 'Sông ngân khi tỏ khi mờ', 4),
(557, '50000.00', '\"“Có ai buổi trưa vắng hay buổi đêm khuya, đi qua các nhà cô đào, và các chị em thanh lâu, thấy họ ăn cái quà ấy một \"', NULL, 'hnbspp-dt.jpg', 500, 'Hà nội băm sáu phố phường - Danh tác', 4),
(558, '88000.00', '\"Ung thư là hành trình khắc nghiệt đối với bất kỳ ai. Tác cuốn sách này không còn nữa, nhưng những trang viết chị để lại về những ngày tháng cuối cùng của đời mình đã lưu lại hình ảnh chị theo một cách đẹp nhất và con người nhất. Với chị ung thư không chỉ là chuyện chữa bệnh, đó là hành trình nhận thức bản thân mãnh liệt, để giữa lúc vật vã vì nỗi đau đớn và niềm khát sống vẫn biết làm đẹp cho bản thân, biết cảm thông, biết gói ghém cuộc đời mình và gửi yêu thương cho những người ở lại.\"', NULL, 'nktrx.jpg', 500, '\"Ngoài kia, trời rất xanh\"', 4),
(559, '98000.00', 'Đinh Hằng của cuốn sách mới này vẫn là Đinh Hằng của', NULL, 'cdkm.jpg', 500, 'Chân đi không mỏi ( TB 2019)', 4),
(560, '108000.00', '\"Bạn có phân vân trong việc đưa con đi tiêm chủng? Bạn có lo ngại về thông tin vắc xin MMR (sởi-rubella-quai bị) gây hội chứng tự kỷ? Và thủy ngân, cùng nhôm có thể được truyền vào cơ thể của trẻ cùng các mũi vắc xin? Con của bạn có phải là một trong hàng nghìn đứa trẻ mắc sởi vào mùa xuân 2019? Hay bé đã may mắn không mắc bệnh? Và hệ miễn dịch của trẻ, cùng của chính chúng ta thực ra hoạt động như thế nào?\"', NULL, 'dcdc-hhvvxvmd.jpg', 500, 'Để con được chích - Hiểu hết về vắc xin và miễn dịch', 4),
(561, '109000.00', '\"Bắt đầu từ những bước chân bỡ ngỡ, háo hức nhưng cũng đơn côi, cô độc trong \"', NULL, 'vn.jpg', 500, 'Về nhà (TB 2019)', 4),
(562, '70000.00', '\"Lần đầu tiên những trang viết ngắn của Phan Vũ được tập hợp lại để ra mắt bạn đọc. Những khắc họa chân dung cũng như những ghi chép ngắn gọn về đời sống của ông cho thấy một Phan Vũ thật khác, không chỉ là một nhà thơ, họa sĩ mà còn là một cây bút văn xuôi giàu năng lượng. Như một điều hiển nhiên, ông dành nhiều tình cảm cho Hà Nội, ông kể lại nhiều chuyện buồn vui với thành phố này, và cả câu chuyện đằng sau bài thơ đã làm làm nên cái tên Phan Vũ.\"', NULL, 'lrtg.jpg', 500, 'Ly rượu trần gian', 4),
(563, '117000.00', '\"Gần 600 năm trước, khi cuộc chiến chống ngoại bang kết thúc, cũng là lúc cuộc chiến phe cánh trong nội bộ triều đình nhà Lê mở ra. Trong cơn khủng hoảng đó, Nguyễn Trãi trở thành nạn nhân hứng chịu tấn thảm kịch oan khiên nhất, dã man nhất lịch sử nước Việt, mang tên \"', NULL, 'tkvn.jpg', 500, 'Thảm kịch vĩ nhân', 4),
(564, '79000.00', '\" chính là những mảnh vụn cuộc sống qua góc nhìn của tuổi trẻ. Mà tuổi trẻ, ấy là tuổi của những đổ vỡ và làm lại, tuổi của khát vọng và ảo tưởng, của sự nhâng nháo bất cần, của những tiếng thở dài và niềm thiết tha…\"', NULL, 'ndtt.jpg', 500, 'Người đưa thư tình', 4),
(565, '129000.00', '-TRẦN TRỌNG KIM', NULL, 'vnsl.jpg', 500, 'Việt Nam Sử Lược', 4),
(566, '69000.00', '\"“Thời sinh viên, trong tôi, ý nghĩ trở thành vĩ nhân luôn thường trực.\"', NULL, 'ktxp307.jpg', 500, 'Ký túc xá phòng 307', 4),
(567, '95000.00', '\"Bạn lại vừa phải trải qua một ngày thứ Hai điển hình… Buổi sáng bạn quên đun nước pha cà phê trước khi đánh răng, bạn ra khỏi nhà muộn hơn 5 phút so với mọi ngày và ôi thôi – kẹt xe! – Bạn đến công ty muộn mất 30 phút. Sau một ngày làm việc mệt mỏi, bạn tìm cách xả xì trét cho mình bằng cách đi shopping, khi ra về bạn bỗng ngước lên và bắt gặp một khuôn mặt hoàn toàn lạ lẫm nhưng lại đáng yêu nhất từng thấy trong đời đang đi ngược chiều. Sau một phút choáng váng, bạn chợt nhận ra là mình phải làm quen với “người ta” bằng mọi giá, khổ nỗi “người ta” đã ở rất xa theo hướng ngược lại của thang cuốn. Bạn hộc tốc chạy đuổi theo, nhưng vô ích, chẳng thấy đâu nữa rồi. Bạn về nhà, định bụng tắm nước nóng cho thoải mái, thế nhưng không tài nào điều chỉnh cho nước vòi sen có nhiệt độ dễ chịu được cả, chỉ có thể là bỏng rát hoặc lạnh toát.\"', NULL, 'mvsvnntdt.jpg', 500, 'Mua vé số vào ngày nào thì dễ trúng?', 4),
(568, '95000.00', '\"Bạn lại vừa phải trải qua một ngày thứ Hai điển hình… Buổi sáng bạn quên đun nước pha cà phê trước khi đánh răng, bạn ra khỏi nhà muộn hơn 5 phút so với mọi ngày và ôi thôi – kẹt xe! – Bạn đến công ty muộn mất 30 phút. Sau một ngày làm việc mệt mỏi, bạn tìm cách xả xì trét cho mình bằng cách đi shopping, khi ra về bạn bỗng ngước lên và bắt gặp một khuôn mặt hoàn toàn lạ lẫm nhưng lại đáng yêu nhất từng thấy trong đời đang đi ngược chiều. Sau một phút choáng váng, bạn chợt nhận ra là mình phải làm quen với “người ta” bằng mọi giá, khổ nỗi “người ta” đã ở rất xa theo hướng ngược lại của thang cuốn. Bạn hộc tốc chạy đuổi theo, nhưng vô ích, chẳng thấy đâu nữa rồi. Bạn về nhà, định bụng tắm nước nóng cho thoải mái, thế nhưng không tài nào điều chỉnh cho nước vòi sen có nhiệt độ dễ chịu được cả, chỉ có thể là bỏng rát hoặc lạnh toát.\"', NULL, 'mvsvnntdt.jpg', 500, 'Mua vé số vào ngày nào thì dễ trúng?', 5),
(569, '85000.00', '\"“… Nhưng, ở một bình diện quan trọng hơn, thì Dân Trí được nâng cao cũng là nền tảng giúp bảo đảm sự Công bằng trong xã hội và tinh thần Dân chủ trong chính trị nhằm mở rộng hơn nữa cánh cửa Tự do của tư duy. Dân trí được nâng cao thì cũng phong phú hoá đời sống người dân về khía cạnh Văn hoá và Nhân văn, giúp thăng hoa con người một cách cân bằng hơn.\"', NULL, 'cucvndcbkddhhk.jpg', 500, 'California Universities & colleges và những điều cần biết khi đi du học Hoa Kỳ', 5),
(570, '88000.00', '', NULL, 'cntoxt.jpg', 500, 'Chuyện người Tây ở xứ ta', 5),
(571, '86000.00', '\"Nhắc đến thành tựu truyện ngắn đương đại mà không kể đến Trần Vũ là một thiếu sót lớn. Đặc trưng của tác giả là những câu chữ hoặc đau đớn đến tan nát, hoặc táo bạo, lạnh lùng đến sắc rợn; các thủ pháp lạ hóa, biến đổi hiện thực, huyền ảo được tận dụng tối đa để khai phá mối tương quan giữa lịch sử, hiện thực, bạo lực và tình dục. Văn của Trần Vũ khước từ sự lưng chừng, mơ hồ, luôn đẩy sức căng đến những góc cạnh cực đoan nhất và tìm thấy con người hoặc ở nơi sâu thẳm, hoặc chốn man rợ khốn cùng.\"', NULL, 'ptcmns.jpg', 500, 'Phép tính của một nho sĩ', 5),
(572, '79000.00', '\"Ngay cả những cánh bồ công anh đang nương theo cơn gió của mình cũng có hành trình riêng của chúng. Tớ hay đằng ấy, mỗ người trong chúng a đều có một con đường. Số phận đặt  chúng ta lên con đường đó, nhưng đi đến đâu làm được gì là việc của mỗi người. Đây chưa phải là điểm dừng của đằng ấy đâu. Hãy đi theo cơn gió của mình đi.\"', NULL, 'qtdchtnm.jpg', 500, 'Quá trẻ để chết : Hành trình nước Mỹ ( TB 2019)', 5),
(573, '77000.00', '\"Trong cuốn sách này, Giáo sư Nguyễn Quang Riệu, nhà khoa học danh tiếng, nhà vật lý thiên văn có đóng góp đáng kể trong lĩnh vực vật lý thiên văn vô tuyến của thế giới trong những năm 1970, đã giúp các bạn đọc trẻ có được vốn hiểu biết cơ bản về vũ trụ: những người cổ đại, từ Ai Cập, Babylon, Hy Lạp đến Trung Hoa có quan niệm thế nào về vũ trụ, vũ trụ ẩn hiện trong văn hóa dân gian Việt Nam ra sao, rồi cũng vũ trụ ấy được nhìn từ phương diện khoa học: nguồn gốc và sự hình thành vũ trụ, trong đó có dải Ngân hà và hệ Mặt Trời, nơi chúng ta đang sống…\"', NULL, 'snktkm.jpg', 500, 'Sông ngân khi tỏ khi mờ', 5),
(574, '50000.00', '\"“Có ai buổi trưa vắng hay buổi đêm khuya, đi qua các nhà cô đào, và các chị em thanh lâu, thấy họ ăn cái quà ấy một \"', NULL, 'hnbspp-dt.jpg', 500, 'Hà nội băm sáu phố phường - Danh tác', 5),
(575, '88000.00', '\"Ung thư là hành trình khắc nghiệt đối với bất kỳ ai. Tác cuốn sách này không còn nữa, nhưng những trang viết chị để lại về những ngày tháng cuối cùng của đời mình đã lưu lại hình ảnh chị theo một cách đẹp nhất và con người nhất. Với chị ung thư không chỉ là chuyện chữa bệnh, đó là hành trình nhận thức bản thân mãnh liệt, để giữa lúc vật vã vì nỗi đau đớn và niềm khát sống vẫn biết làm đẹp cho bản thân, biết cảm thông, biết gói ghém cuộc đời mình và gửi yêu thương cho những người ở lại.\"', NULL, 'nktrx.jpg', 500, '\"Ngoài kia, trời rất xanh\"', 5),
(576, '98000.00', 'Đinh Hằng của cuốn sách mới này vẫn là Đinh Hằng của', NULL, 'cdkm.jpg', 500, 'Chân đi không mỏi ( TB 2019)', 5),
(577, '108000.00', '\"Bạn có phân vân trong việc đưa con đi tiêm chủng? Bạn có lo ngại về thông tin vắc xin MMR (sởi-rubella-quai bị) gây hội chứng tự kỷ? Và thủy ngân, cùng nhôm có thể được truyền vào cơ thể của trẻ cùng các mũi vắc xin? Con của bạn có phải là một trong hàng nghìn đứa trẻ mắc sởi vào mùa xuân 2019? Hay bé đã may mắn không mắc bệnh? Và hệ miễn dịch của trẻ, cùng của chính chúng ta thực ra hoạt động như thế nào?\"', NULL, 'dcdc-hhvvxvmd.jpg', 500, 'Để con được chích - Hiểu hết về vắc xin và miễn dịch', 5),
(578, '109000.00', '\"Bắt đầu từ những bước chân bỡ ngỡ, háo hức nhưng cũng đơn côi, cô độc trong \"', NULL, 'vn.jpg', 500, 'Về nhà (TB 2019)', 5),
(579, '70000.00', '\"Lần đầu tiên những trang viết ngắn của Phan Vũ được tập hợp lại để ra mắt bạn đọc. Những khắc họa chân dung cũng như những ghi chép ngắn gọn về đời sống của ông cho thấy một Phan Vũ thật khác, không chỉ là một nhà thơ, họa sĩ mà còn là một cây bút văn xuôi giàu năng lượng. Như một điều hiển nhiên, ông dành nhiều tình cảm cho Hà Nội, ông kể lại nhiều chuyện buồn vui với thành phố này, và cả câu chuyện đằng sau bài thơ đã làm làm nên cái tên Phan Vũ.\"', NULL, 'lrtg.jpg', 500, 'Ly rượu trần gian', 5),
(580, '117000.00', '\"Gần 600 năm trước, khi cuộc chiến chống ngoại bang kết thúc, cũng là lúc cuộc chiến phe cánh trong nội bộ triều đình nhà Lê mở ra. Trong cơn khủng hoảng đó, Nguyễn Trãi trở thành nạn nhân hứng chịu tấn thảm kịch oan khiên nhất, dã man nhất lịch sử nước Việt, mang tên \"', NULL, 'tkvn.jpg', 500, 'Thảm kịch vĩ nhân', 5),
(581, '75000.00', 'được xem là tập tiếp theo của cuốn', NULL, 'tddl.jpg', 500, 'Tàn đèn dầu lạc', 6),
(582, '75000.00', '\" là tập phóng sự về việc hút thuốc phiện ở Việt Nam hồi đầu thế kỷ 20. Hút thuốc phiện dưới con mắt của Nguyễn Tuân vừa độc hại như một thứ gây nghiện, tàn phá sức khỏe của kẻ hút và làm khốn đốn gia đình, xã hội. Nhưng đồng thời hút thuộc phiện cũng được Nguyễn Tuân mô tả như một thú chơi của giới nghệ sĩ, trí thức, đem đến những cảm xúc thăng hoa trong sáng tạo và công việc.\"', NULL, 'nddl-vndt.jpg', 499, 'Ngọn đèn dầu lạc - Việt Nam danh tác', 6),
(583, '129000.00', '', NULL, 'bhlmts-mmoca.jpg', 500, 'Bất hạnh là một tài sản - Một mình ở Châu Âu', 6),
(584, '120000.00', '\"cuốn sách tập hợp các bài viết thể hiện quan điểm, suy ngẫm của tác giả Nguyễn Ngọc Tiến về lịch sử, văn hóa, xã hội Việt Nam trong quá khứ cũng như trong hiện tại. \"', NULL, 'qdoncvn.jpg', 500, 'Qua đêm ở nhà các vua Nguyễn', 6),
(585, '99000.00', '\"Cuốn sách CÁ HỒI của Tâm Bùi kể về hành trình thay đổi suy nghĩ, lối sống sau khi giác ngộ được những lý lẽ của đạo Phật (thông qua các khóa tu tập tại làng Mai và sự giảng đạo của thiền sư Thích Nhất Hạnh).\"', NULL, 'ch-httt.jpg', 500, 'Cá hồi – Hành trình tỉnh thức', 6),
(586, '88000.00', '', NULL, 'cmpvdqp.jpg', 500, 'Có một phố vừa đi qua phố', 6),
(587, '120000.00', 'Một ghi chép đầy tình yêu thương về hành trình làm bố của nhà báo sắc sảo Phạm Gia Hiền.', NULL, 'bncc.jpg', 500, '\"Bố ngồi cùng con, nhé!\"', 6),
(588, '139000.00', '\"Năm Cảnh Hưng thứ bốn mươi ba, huyện Cốc Dương, trấn Sơn Tây, đêm rằm tháng Bảy. Một gã phù thủy đang lập trận thu nạp âm binh giữa bãi chôn người. Phạm Đình Quyết, dòng dõi của một gia đình chín đời làm nghề khâm liệm đã vô tình chứng kiến cảnh tượng kinh dị này. Từ đây, hắn bắt đầu bước chân vào một thế giới chưa từng biết. Hắn dần dần khám phá ra bí mật của gia đình mình. Và thân phận thực sự của hắn, một Lạc Vu Điện Súy của Trấn Quốc Hội, nơi tập hợp những phù thủy cao tay, những nhà huyền thuật xuất sắc đang âm thầm bảo vệ Đông Kinh trước sự tấn công của giáo phái Hàng Long tà đạo từ ngoại bang.\"', NULL, 'dndt.jpg', 500, 'Đại Nam dị truyện', 6),
(589, '119000.00', '\"Sinh ra ở Moscow bởi bố mẹ người Việt Nam nhưng lại tin rằng mình có phần nào đó là người Xô viết chuyển về Hà Nội khi lên 3 và vào học trường Quốc tế Pháp dưới sự ủng hộ của ông bà 15 tuổi rời Việt Nam sang Mỹ để học tại một trường nội trú ở tiểu bang Connecticut câu hỏi mà Ngọc Nguyễn cũng như những đứa trẻ nhiễu văn hóa khác cảm thấy khó trả lời nhất là \"\"Bạn đến từ đâu?”. Vượt lên trên một cuốn nhật ký cá nhân\"', NULL, 'dtnvh.jpg', 500, 'Đám trẻ nhiễu văn hóa', 6),
(590, '52000.00', '\"\"\"KHI TÔI QUAY LẠI NHÌN CHỒNG NÀNG tôi thấy rõ cái lãnh đạm của người đàn ông ấy... Nàng có sung sướng không? Nàng có còn nhớ đến tôi không? Ngậm ngùi tôi nghĩ đến cuộc ái ân ngắn ngủi...trong mấy tháng hè: cái tình yêu  biết đâu chẳng vẫn còn để lại trong lòng nàng một vẻ rực rỡ như ánh nắng trong vườn.\"\"\"', NULL, 'ntv-vndt.jpg', 500, 'Nắng trong vườn - Việt Nam Danh Tác', 6),
(591, '200000.00', '\"Ở Việt Nam giai đoạn trung đại, nghề nghiệp gắn liền với gia đình, làng xã, địa phương. Mỗi vùng đất có một đặc sản nghề riêng mà tiếng tăm vẫn được truyền đến ngày nay nhờ được lưu truyền trong ca dao cổ. Việc truyền nghề được coi là việc riêng của dòng họ hay địa phương, thậm chí nghề được giữ gìn như bí quyết riêng của gia đình hay dòng họ, ngăn cấm truyền dạy cho người ngoài...\"', NULL, 'tdnovntpt.jpg', 500, 'Trường dạy nghề ở Việt Nam thời Pháp thuộc (1898-1945)', 6),
(592, '58000.00', '\"“… qua một đêm mưa rào, trời bỗng đổi ra gió bấc, rồi cái lạnh ở đâu đến làm cho người ta tưởng đang ở giữa mùa  đông rét mướt. Sơn tung chăn tỉnh dậy, nhưng không bước xuống giường ngay như mọi khi, còn ngồi thu tay vào  trong bọc, bên cạnh đứa em bé vẫn nắm tay ngủ kỹ. Chị Sơn và mẹ Sơn đã trở dậy, đang ngồi quạt hỏa lò để pha nước chè uống. Sơn nhận thấy mọi người đã mặc áo rét cả rồi.”\"', NULL, 'gdm-vndt.jpg', 500, 'Gió đầu mùa - Việt Nam Danh Tác', 6),
(593, '54000.00', '\"\"\" Một sáng tỉnh giấc sau những giấc mơ xáo động Gregor Samsa nằm trên giường nhận thấy mình đã biến thành một con côn trùng khổng lồ. Anh nằm ngửa trên cái lưng rắn như thể được bọc giáp sắt và khi dợm nhấc đầu lên anh nhìn thấy bụng mình khum tròn nâu bóng phân chia làm nhiều đốt cong cứng đờ tấm chăn bong đắp trên bụng đã bị xô lệch gần tuột hẳn. Chân anh nhiều ra mảnh khảnh đến thảm hại so với phần còn lại của thân hình to đùng vung vẩy bất lực trước mắt anh.\"\"\"', NULL, 'ht.jpg', 500, 'HÓA THÂN', 6),
(594, '179000.00', '\"Bản tính của con người được thể hiện thông qua cách chúng ta đối thoại với người khác. Trong bất kỳ trường hợp nào, chúng ta đều có thể lựa chọn thái độ khi trò chuyện. Thông qua thái độ ấy, ta có thể tự mình xây dựng đồng thời cũng có thể tự tay phá hủy các mối quan hệ và phẩm cách bản thân.\"', NULL, 'tslbnlktkv.jpg', 500, 'Tại sao lời bạn nói lại khiến tôi không vui', 6),
(595, '198000.00', '\"Việc biên soạn, sưu tầm các bài ca dao, tục ngữ in thành sách được ghi nhận sớm nhất ở Việt Nam từ khoảng cuối thế kỷ 17. Tuy nhiên điều đáng tiếc là các sách này chỉ sưu tầm được một số lượng bài rất hạn chế, khiến cho nhiều bài ca dao, tục ngữ có nguy cơ bị mai một, thất tán.\"', NULL, 'tnpd.jpg', 500, 'Tục ngữ phong dao', 6),
(596, '116000.00', '\"Không lối thoát không nơi nương tựa với Akari \"\"thần tượng\"\" là lý do em hít thở mỗi ngày là \"\"xương sống\"\" của em. Nhưng thần tượng của em dính \"\"phốt\"\" rồi! Ngọn lửa thị phi ngày càng lan rộng. Thế giới của em từng phần vụn vỡ. Phải làm sao để cứu chính mình? \"', NULL, 'ttctdpr.jpg', 500, 'Thần tượng của tôi dính phốt rồi', 6),
(597, '180000.00', '\"Nhiều năm trước, một cô gái đã tiêu toàn bộ tiền tiết kiệm để đến với Tuần lễ Thời trang Paris, bảy, tám ngày liền ngồi tàu điện ngầm đến các show diễn khác nhau, thường phải đứng cả ngày, lúc nóng lúc lạnh đến nỗi phát sốt. \"', NULL, 'tn-kccccnpntc.jpg', 500, 'Tao nhã - Khí chất cần có của người phụ nữ thành công', 6),
(598, '72000.00', '\"Khi nàng biết cách làm một người đàn bà thực sự, ấy là khi nàng xứng được yêu.\"', NULL, 'mlnhdynhg.jpg', 500, '\"Muốn làm nữ hoàng, đừng yêu như hầu gái\"', 6),
(599, '130000.00', '\"\"\"Thơ của Trần Vàng Sao chính là cuộc đời ông. [...] Thơ ông hiện ra như chính áo quần ông tóc tai ông hơi thở ông ánh mắt ông giọng nói ông cảm giác ông mồ hôi ông đau đớn ông giận dữ ông giày vò ông tuyệt vọng ông khát vọng ông... và nhịp đập trái tim ông là thứ kỳ diệu nhất gắn kết toàn bộ những gì thuộc về ông để vang lên thành thi ca. Bởi thế thơ ông chân thực và mãnh liệt như máu chảy trong huyết quản ông.\"', NULL, 'btcmnynm.jpg', 500, 'Bài thơ của một người yêu nước mình', 6),
(600, '169000.00', 'Ngập tràn các hoạt động sáng tạo cho bạn nhỏ 3+.', NULL, 'xstrr-mnnnmbt.jpg', 500, 'Xưởng sáng tạo rộn ràng- Mỗi ngày nắn nót một bức tranh', 7),
(601, '119000.00', 'Nhã Nam thiếu nhi | SÁCH TƯƠNG TÁC CHƠI VÀ HỌC', NULL, 'ptkntdpb-l4.jpg', 500, 'Phát triển kỹ năng tư duy phản biện – Lớp 4', 7),
(602, '159000.00', '\"Con đường hiểm nguy là tập thứ năm trong bộ Mèo chiến binh (2003-2004) của tác giả Erin Hunter. Bộ truyện giành được nhiều phản hồi tích cực, được dịch ra hơn 20 thứ tiếng và có lực lượng người hâm mộ hùng hậu trên khắp thế giới\"', NULL, 'mcb-cdhn.jpg', 498, 'Mèo chiến binh - Con đường hiểm nguy', 7),
(603, '190000.00', '\"Tập truyện đầu tay này của tôi tập hợp những ghi chép rải rạc về tình yêu và ước mơ, những trải nghiệm tự chữa lành sau vụn vỡ, những tâm sự về số phận và hy vọng.\"', NULL, 'ttnllchmv.jpg', 496, 'Trái tim người lớn là con hàu mang vỏ', 7),
(604, '168000.00', '\"Nước Đại Việt triều Lý đời vua Lý Anh Tông xảy ra loạn Thân Lợi. Thân Lợi là một phù thủy cao tay có tài “mê tâm thuật”, có thể làm người ta u mê tinh thần để dễ sai khiến. Với pháp lực bẩm sinh hiếm thấy cộng thêm quá trình tu tập, Thân Lợi trở thành giáo chủ của Xương Cuồng giáo, một tà giáo thờ thần Xương Cuồng, thâu tập những kẻ chuyên luyện tà năng bằng các cách thức man rợ. Nhưng tham vọng của Thân Lợi không dừng ở đó, hắn muốn chính mình trở thành thần Xương Cuồng, để sở hữu quyền năng vô biên. Kẻ nào muốn luyện thành phép này phải tột bậc kỳ công cùng may mắn mới hội đủ các yếu tố. Thân Lợi đã chuẩn bị nhiều năm, và gần như đã có tất cả...\"', NULL, 'ltdt.jpg', 498, 'Lý triều dị truyện', 7),
(605, '75000.00', 'được xem là tập tiếp theo của cuốn', NULL, 'tddl.jpg', 500, 'Tàn đèn dầu lạc', 7),
(606, '135000.00', 'Tác phẩm hài hước siêu hấp dẫn mới nhất của nhà văn thiếu nhi Anh ăn khách David Walliams.', NULL, 'bdnd.jpg', 500, 'Băng đảng Nửa đêm', 8),
(607, '50000.00', '\"Bộ sách thiết thực này là kết hợp giữa những minh họa trực quan cao độ và chủ đề giáo dục trọng yếu. Tất các cuốn sách trong bộ đều có Phần câu hỏi thảo luận để hỗ trợ phụ huynh khơi gợi và dẫn dắt những cuộc trò chuyện với trẻ về cảm xúc, nỗi lo lắng, thất bại, sự tử tế, bảo vệ thân thể, bình đẳng giới và đa dạng giới,... Bộ sách là công cụ giúp trẻ nói lên tiếng nói của mình và khuyến khích trẻ tham gia chủ động, tích cực vào việc học hỏi.\"', NULL, 'ptttcx-cdlcm.jpg', 500, 'Phát triển trí tuệ cảm xúc - Con được là chính mình!', 8),
(608, '219000.00', '\"3 cuốn tiếp theo trong series Hỏi đáp cùng em trứ danh của NXB Larrouse, nhà xuất bản sách kiến thức thiếu nhi hàng đầu nước Pháp.\"', NULL, 'hdce-tvs.jpg', 500, 'Hỏi đáp cùng em- Thật vậy sao?', 8),
(609, '219000.00', '\"3 cuốn tiếp theo trong series Hỏi đáp cùng em trứ danh của NXB Larrouse, nhà xuất bản sách kiến thức thiếu nhi hàng đầu nước Pháp.\"', NULL, 'hdce-llcchvs.jpg', 500, 'Hỏi đáp cùng em - Lại là các câu hỏi vì sao', 8),
(610, '50000.00', 'PHÁT TRIỂN TRÍ TUỆ CẢM XÚC - hành trang tâm lý vững vàng cho con.', NULL, 'ptttcx-cxccmg.jpg', 500, 'Phát triển trí tuệ cảm xúc- Cảm xúc của con màu gì?', 8),
(611, '219000.00', '\"3 cuốn tiếp theo trong series Hỏi đáp cùng em trứ danh của NXB Larrouse, nhà xuất bản sách kiến thức thiếu nhi hàng đầu nước Pháp.\"', NULL, 'hdce-vvhdtn.jpg', 500, 'Hỏi đáp cùng em -  Vạn vật hoạt động thế nào?', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tacgia_sach`
--

CREATE TABLE `tacgia_sach` (
  `tacgia_id` bigint NOT NULL,
  `sach_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tacgia_sach`
--

INSERT INTO `tacgia_sach` (`tacgia_id`, `sach_id`) VALUES
(14, 124),
(15, 249),
(7, 250),
(18, 251),
(49, 252),
(12, 253),
(48, 254),
(33, 255),
(1, 256),
(3, 257),
(22, 258),
(46, 259),
(17, 260),
(30, 261),
(22, 262),
(4, 263),
(16, 264),
(27, 265),
(16, 266),
(25, 267),
(4, 268),
(24, 269),
(9, 270),
(44, 271),
(30, 272),
(11, 273),
(30, 274),
(8, 275),
(36, 276),
(43, 277),
(23, 278),
(40, 279),
(39, 280),
(1, 281),
(44, 282),
(39, 283),
(18, 284),
(35, 285),
(1, 286),
(22, 287),
(17, 288),
(21, 289),
(24, 290),
(33, 291),
(50, 292),
(40, 293),
(43, 294),
(36, 295),
(3, 296),
(18, 297),
(39, 298),
(48, 299),
(33, 300),
(22, 301),
(44, 404),
(40, 405),
(25, 406),
(15, 407),
(48, 408),
(37, 409),
(5, 410),
(31, 411),
(37, 412),
(23, 413),
(27, 414),
(34, 415),
(10, 416),
(45, 417),
(1, 418),
(44, 419),
(21, 420),
(39, 421),
(3, 422),
(43, 423),
(32, 424),
(15, 425),
(22, 426),
(8, 427),
(39, 428),
(39, 429),
(40, 430),
(37, 431),
(17, 432),
(29, 433),
(43, 434),
(21, 435),
(19, 436),
(4, 437),
(32, 438),
(48, 439),
(11, 440),
(42, 441),
(19, 442),
(23, 443),
(16, 444),
(4, 445),
(20, 446),
(43, 447),
(3, 448),
(23, 449),
(43, 450),
(14, 451),
(21, 452),
(3, 453),
(32, 454),
(48, 455),
(37, 456),
(49, 457),
(36, 458),
(45, 459),
(12, 460),
(32, 461),
(2, 462),
(9, 463),
(44, 464),
(29, 465),
(18, 466),
(31, 467),
(43, 468),
(4, 469),
(15, 470),
(30, 471),
(46, 472),
(48, 473),
(37, 474),
(30, 526),
(8, 527),
(25, 528),
(19, 529),
(46, 530),
(29, 531),
(30, 532),
(49, 533),
(12, 534),
(27, 535),
(13, 536),
(15, 537),
(33, 538),
(4, 539),
(38, 540),
(20, 541),
(34, 542),
(39, 543),
(17, 544),
(11, 545),
(20, 546),
(4, 547),
(2, 548),
(14, 549),
(36, 550),
(20, 551),
(33, 552),
(8, 553),
(24, 554),
(2, 555),
(33, 556),
(1, 557),
(11, 558),
(33, 559),
(8, 560),
(15, 561),
(37, 562),
(48, 563),
(30, 564),
(45, 565),
(24, 566),
(19, 567),
(18, 568),
(13, 569),
(42, 570),
(36, 571),
(23, 572),
(33, 573),
(5, 574),
(20, 575),
(28, 576),
(22, 577),
(18, 578),
(12, 579),
(26, 580),
(18, 581),
(45, 582),
(22, 583),
(38, 584),
(15, 585),
(33, 586),
(27, 587),
(2, 588),
(29, 589),
(35, 590),
(48, 591),
(17, 592),
(4, 593),
(35, 594),
(27, 595),
(36, 596),
(14, 597),
(10, 598),
(42, 599),
(5, 600),
(46, 601),
(42, 602),
(19, 603),
(48, 604),
(12, 605),
(23, 606),
(43, 607),
(46, 608),
(28, 609),
(37, 610),
(39, 611);

-- --------------------------------------------------------

--
-- Table structure for table `tac_gia`
--

CREATE TABLE `tac_gia` (
  `id` bigint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ten_tac_gia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tac_gia`
--

INSERT INTO `tac_gia` (`id`, `image`, `ten_tac_gia`) VALUES
(1, 'nha_van_di_li.jpg', 'Di Li'),
(2, 'tac_gia_nguyen_thi_ninh.jpg', 'Nguyễn Thị Ninh'),
(3, 'bs_le_thi_hai.jpg', 'BS Lê Thị Hải'),
(4, 'Antonio-Fischetti.jpg', 'Antonio Fischetti'),
(5, NULL, 'Đỗ Văn Ninh'),
(6, 'Erik-Orsenna.jpg', 'Erik Orsenna'),
(7, 'Rolf-Dobelli.jpg', 'Rolf Dobelli'),
(8, 'Renzo-Barsotti.webp', 'Renzo Barsotti'),
(9, 'Manfred-F.-R.-Kets-de-Vries.jpg', 'Manfred F. R. Kets de Vries'),
(10, 'Frédéric-Saldmann.jpg', 'Frédéric Saldmann'),
(11, 'elisabeth-Jammes.jpg', 'Élisabeth Jammes'),
(12, 'Ngoc-anh.jpg', 'Ngọc Ánh'),
(13, 'Đại-sư-Jetsunma-Palmo.jpg', 'Đại sư Jetsunma Palmo'),
(14, 'Alex-Frith.jpg', '\"Alex Frith, Rosie Hore & Louie Stowell\"'),
(15, 'Thu-Hà-(Mẹ-Xu-Sim).jpg', 'Thu Hà (Mẹ Xu-Sim)'),
(16, 'Le-Bich-vhsaigon.jpg', 'Lê Bích'),
(17, NULL, 'Mitsuharu Ohyama'),
(18, NULL, 'Linh trang'),
(19, NULL, 'Thạc sĩ Trần Quang Dũng (chủ biên)'),
(20, NULL, 'An Minjung'),
(21, NULL, 'Kim Huggens'),
(22, NULL, 'Trần Trương Phúc Hạnh'),
(23, NULL, 'Katie Hewett - Tracie Young'),
(24, NULL, 'Chu Hồng Vân'),
(25, NULL, 'Isabelle Filliozat'),
(26, NULL, 'Alain Boyer'),
(27, NULL, 'Sophie Crépon'),
(28, NULL, 'Lê Thanh Tùng'),
(29, NULL, 'Phương Đặng'),
(30, NULL, 'Anthonye. Wolf'),
(31, NULL, 'Hà Hạo'),
(32, NULL, 'Danh Việt'),
(33, NULL, 'Kẩm Nhung'),
(34, NULL, 'Anh Thư - Thu Giang'),
(35, NULL, 'Makoto Minemura'),
(36, NULL, 'Daniel J. Boorstin'),
(37, NULL, 'Tatsuki Noda'),
(38, NULL, 'Azumo Sonoko'),
(39, NULL, 'Randall Munroe'),
(40, NULL, 'Iwamoto Kenichi'),
(41, NULL, 'Tachikawa Mitsuaki'),
(42, NULL, 'Toshifumi Suzuki'),
(43, NULL, 'Bồ Câu'),
(44, NULL, 'Rory (Joon Hee Kim)'),
(45, NULL, 'Thành Phong'),
(46, NULL, 'Nguyễn Bích Hiền'),
(47, NULL, 'Louie Stowell.'),
(48, NULL, 'Bác sĩ Trương Hữu Khanh'),
(49, NULL, 'Annabel Savery'),
(50, NULL, 'Madeleine L’Engle');

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `id` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gioi_tinh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tai_khoan`
--

INSERT INTO `tai_khoan` (`id`, `email`, `gioi_tinh`, `password`, `role`, `username`) VALUES
(1, 'mail@abc.com', 'Nam', 'c', 'admin', 'ab');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt57maavf6s28hxyar724mdr1b` (`don_hang_id`),
  ADD KEY `FKac1uk7uyp826gan62mtohfd2l` (`sach_id`);

--
-- Indexes for table `chi_tiet_gio_hang`
--
ALTER TABLE `chi_tiet_gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsfbp0yj5l4nv2atfh77yvi7yp` (`sach_id`),
  ADD KEY `FKp2i4brhsye436bjatiqhx758d` (`tai_khoan_id`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKq3eokhf3aykw9ns4uua8rdq58` (`tai_khoan_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfj3idrswe3tei61yiyvpgg8ot` (`sach_id`),
  ADD KEY `FKtms6pb6r6dxbp04y67x0i00x7` (`tai_khoan_id`);

--
-- Indexes for table `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkko0pe28rjnckfqnblx18fnro` (`danh_muc_id`);

--
-- Indexes for table `tacgia_sach`
--
ALTER TABLE `tacgia_sach`
  ADD KEY `FKddd8e8k87u6u8bg0kmngrja86` (`sach_id`),
  ADD KEY `FKle9m691plld3ai6gn47rs4fcs` (`tacgia_id`);

--
-- Indexes for table `tac_gia`
--
ALTER TABLE `tac_gia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chi_tiet_gio_hang`
--
ALTER TABLE `chi_tiet_gio_hang`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sach`
--
ALTER TABLE `sach`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=612;

--
-- AUTO_INCREMENT for table `tac_gia`
--
ALTER TABLE `tac_gia`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `FKac1uk7uyp826gan62mtohfd2l` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`),
  ADD CONSTRAINT `FKt57maavf6s28hxyar724mdr1b` FOREIGN KEY (`don_hang_id`) REFERENCES `don_hang` (`id`);

--
-- Constraints for table `chi_tiet_gio_hang`
--
ALTER TABLE `chi_tiet_gio_hang`
  ADD CONSTRAINT `FKp2i4brhsye436bjatiqhx758d` FOREIGN KEY (`tai_khoan_id`) REFERENCES `tai_khoan` (`id`),
  ADD CONSTRAINT `FKsfbp0yj5l4nv2atfh77yvi7yp` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`);

--
-- Constraints for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `FKq3eokhf3aykw9ns4uua8rdq58` FOREIGN KEY (`tai_khoan_id`) REFERENCES `tai_khoan` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FKfj3idrswe3tei61yiyvpgg8ot` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`),
  ADD CONSTRAINT `FKtms6pb6r6dxbp04y67x0i00x7` FOREIGN KEY (`tai_khoan_id`) REFERENCES `tai_khoan` (`id`);

--
-- Constraints for table `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `FKkko0pe28rjnckfqnblx18fnro` FOREIGN KEY (`danh_muc_id`) REFERENCES `danhmuc` (`id`);

--
-- Constraints for table `tacgia_sach`
--
ALTER TABLE `tacgia_sach`
  ADD CONSTRAINT `FKddd8e8k87u6u8bg0kmngrja86` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`),
  ADD CONSTRAINT `FKle9m691plld3ai6gn47rs4fcs` FOREIGN KEY (`tacgia_id`) REFERENCES `tac_gia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
