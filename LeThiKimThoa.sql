Create database LeThiKimThoaDB
use LeThiKimThoaDB
Create table UserAccount
(
	ID int IDENTITY (1,1) primary key,
	UserName varchar(200) not null,
	Password varchar(200) not null,
	Status nvarchar(200) null
)

Create table Category
(
	ID int IDENTITY (1,1) primary key,
	Name nvarchar(200) not null,
	Description nvarchar(max) null
)

Create table Product
(
	ID varchar(10) primary key,
	ProTypeId int null,
	Name nvarchar(200) not null,
	UnitCost varchar(100) not null,
	Quantity int not null,
	Size varchar(20) null,
	Image nvarchar(max)  null,
	Description nvarchar(max) null,
	Status bit null,
	constraint fk_Product_Category foreign key (ProTypeId) references Category(ID)
)


INSERT INTO UserAccount(UserName,Password,Status) VALUES ('Admin','21232f297a57a5a743894a0e4a801fc3','Active')
INSERT INTO UserAccount(UserName,Password,Status) VALUES ('KimThoa','58515e8785544a71a8adf075f353f80c','Active')
INSERT INTO UserAccount(UserName,Password,Status) VALUES ('QuocKhiem','9b0598c730d4dea03174c2fe58a48e28','Active')
INSERT INTO UserAccount(UserName,Password,Status) VALUES ('DiemHuong','145a829dff80553d2747dfa14f44cc56','Active')
INSERT INTO UserAccount(UserName,Password,Status) VALUES ('VanTri','d2cfe69af2d64330670e08efb2c86df7','Blocked')
INSERT INTO UserAccount(UserName,Password,Status) VALUES ('KimAn','18b049cc8d8535787929df716f9f4e68','Blocked')

INSERT INTO Category(Name, Description) VALUES (N'Quần áo bé gái',N'Gồm có đồ bộ, váy đầm, đồ bơi, áo khoác, áo, quần')
INSERT INTO Category(Name, Description) VALUES (N'Quần áo bé trai',N'Gồm có đồ bộ,đồ bơi, áo khoác áo, quần')
INSERT INTO Category(Name, Description) VALUES (N'Giày dép cho bé',N'Gồm có giày cho bé gái, giày cho bé trai')
INSERT INTO Category(Name, Description) VALUES (N'Phụ kiện cho bé',N'Balo, nón, mũ, kính cho bé trai và bé gái')

INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BG001',1, N'Đầm đũi cổ bèo', '147000',150,'S,M,L', N'/Images/damduitarng-265x265.jpg', N'Đầm đũi cổ bèo dễ thương cho bé gái 2-9 tuổi có đủ size S,M,L','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BG002',1, N'Đầm loang cổ yếm đính hạt', '167000',200,'S,M,L', N'/Images/damhatloangtim1-265x265.jpg', N'Đầm loang cổ yếm đính hạt dễ thương cho bé gái 10 - 15 tuổi','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BG003',1, N'Set đồ bơi hở lưng', '146000',50,'S,M,L', N'/Images/setboiholung3-265x265.jpg', N'Set bơi hở lưng cho bé gái 10 - 15 tuổi','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BG004',1, N'Áo sát nách MY BOOY', '99000',250,'S,M,L', N'/Images/aosatnachmybooby2-265x265.jpg', N'Áo sát nách MY BOOY dễ thương cho bé gái từ 10 - 16 tuổi','False')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BG005',1, N'Quần sort jean ', '140000',100,'S,M,L', N'/Images/quansortjeanhlxanh-265x265.jpg', N'Quần sort jeans dễ thương cho bé gái 2 - 9 tuổi','False')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BT001',2, N'Set áo quần lính ACTION', '145000',80,'S,M,L', N'/Images/SETLINHTRANG-265x265.jpg', N'Set áo quần lính ACTION đầy sự năng động cho bé trai từ 2 - 9 tuổi','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BT002',2, N'Bộ sát nách thể thao', '135000',90,'S,M,L', N'/Images/bosatnachthehtaoso101-265x265.jpg', N'Bộ sát nách thể thao số 10 dễ thương cho bé trai từ 2 - 9  tuổi','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BT003',2, N'Set bơi BATMAN', '220000',40,'S,M,L', N'/Images/SETBOIbatmanden-265x265.jpg', N'Set bơi BATMAN kèm nón và choàng dễ thương cho bé trai 2- 10 tuổi','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('BT004',2, N'Áo sơ mi cà vạt', '160000',130,'S,M,L', N'/Images/aosomicavatvang-265x265.jpg', N'Áo sơ mi cà vạt dễ thương cho bé trai từ 9 - 15 tuổi','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size,Image, Description, Status) VALUES ('BT005',2, N'Quần jean dài', '155000',110,'S,M,L', N'/Images/quanjeansrachxanhdam-265x265.jpg', N'Quần jeans dài wash rách dễ thương cho bé từ 2 - 9 tuổi','False')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('GD001',3, N'Dép siêu nhân nhện', '115000',210,'S,M,L', N'/Images/depsieunhan1-265x265.jpg', N'Dép SIÊU NHÂN NHỆN cực ngầu cho bé trai','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('GD002',3, N'Giày sandal dây kéo', '205000',140,'S,M,L', N'/Images/sandal56-265x265.jpg', N'Giày sandal dây kéo siêu dễ thương cho bé gái','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('GD003',3, N'Giày sandal siêu nhân', '195000',30,'S,M,L', N'/Images/sandal60-265x265.jpg', N'Giày sandal siêu nhân ĐIỆN QUANG cực ngầu cho bé trai size trung','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('GD004',3, N'Giày boot', '215000',30,'S,M,L', N'/Images/giayboot60-265x265.jpg', N'Giày boot phối kim tuyến GẤU NƠ dễ thương cho bé gái','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('GD005',3, N'Giày búp bê', '99000',90,'S,M,L', N'/Images/giaybegai12-265x265.jpg', N'Giày búp bê caro dễ thương cho bé gái','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('PK001',4, N'Balo SUPERMAN', '180000',80,null, N'/Images/balo33-265x265.jpg', N'Balo đi học SUPERMAN cực ngầu cho bé','False')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('PK002',4, N'Balo con gấu', '170000',160,null, N'/Images/balo12-265x265.jpg', N'Balo CON GẤU VÀNG siêu dễ thương cho bé','False')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('PK003',4, N'Nón 3D Elsa', '110000',120, null,N'/Images/non3D2-265x265.jpg', N'Nón 3D ELSA dễ thương cho bé','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('PK004',4, N'Nón 3D BATMAN', '110000',30,null, N'/Images/nonbatman2-265x265.jpg', N'Nón 3D BATMAN cực ngầu cho bé','True')
INSERT INTO Product (ID,ProTypeId, Name, UnitCost, Quantity, Size, Image, Description, Status) VALUES ('PK005',4, N'Nón chống dịch', '80000',40,null, N'/Images/nonchongdich1-265x265.jpg', N'Nón chống dịch dễ thương cho bé','True')