create table User( /*유저테이블*/
    UID varchar(50) primary key, /*아이디*/
    UPW varchar(50) not null,    /*비밀번호*/
    Name nvarchar(5) not null,   /*이름*/
    Birthday date not null,      /*생년월일*/
    Phone nvarchar(20) not null, /*전화번호*/
    Addr nvarchar(200) not null, /*주소*/
    AddrDetail nvarchar(200),    /*상세주소*/
    Email nvarchar(200) not null,/*이메일*/
    Gender char(5) not null,     /*성별*/
    KeyWord varchar(20) not null,/*관심키워드*/
    pic nvarchar(200) not null,  /*사진*/
    UNO int not null             /*NO*/
);

create table Meeting( /*모임테이블*/
    M_Name nvarchar(10) not null,    /*모임이름*/
    M_Code nvarchar(10) primary key, /*모임코드*/
    M_Pic  nvarchar(200) not null,   /*모임사진*/
    M_Pass varchar(50) not null,     /*모임비밀번호*/
    M_regDate datetime default now() /*시작날짜*/
);

create table Meeting_User( /*모임회원*/
    MU_ID varchar(50) not null,   /*모임회원 아이디*/
    MU_Code varchar(50) not null, /*모임회원 코드 타임바꿔야함*/
    MU_PWChk char(5) not null,    /*모임회원 비밀번호 가입여부*/
    foreign key(MU_ID) references User(UID),
    foreign key(MU_Code) references Meeting(M_Code)
);
 
create table Circles( /*동아리*/
    C_PID varchar(50) not null,       /*회장아이디*/
    C_Code varchar(50) not null,      /*동아리pk 타입수정해야함*/
    C_Welcome nvarchar(200),          /*인사말*/
    C_Condition nvarchar(500),        /*가입조건*/
    C_Name nvarchar(10) not null,     /*동아리 이름*/
    C_Category nvarchar(10) not null, /*카테고리*/
    C_Tag nvarchar(50) not null,      /*해쉬태그*/
    C_Pic nvarchar(200),              /*사진*/
    C_Spot nvarchar(200),             /*활동장소*/
    C_PhoneChk char(5) not null,      /*연락처 공개 여부*/
    C_regDate datetime default now() not null /*시작날짜*/
);


create table Circles_User(
    CU_Code varchar(50) primary key,  /*동아리코드*/
    CU_ID varchar(50) primary key,    /*아이디*/
    CU_PrivateChk char(5) not null,   /*개인정보 공유 여부*/
    CU_StatusChk char(5) not null,    /*회원상태*/
    CU_FavoriteChk int not null,      /*즐겨찾기 여부*/
    foreign key(CU_Code) references Circles(C_Code),
    foreign key(CU_ID) references User(UID)
);

create table Circles_Notice(
    CNC_Code varchar(50),             /*동아리코드 타입수정해야함*/
    CN_NO int primary key,            /*동아리NO*/
    CN_Title varchar(20) not null,    /*제목*/
    CN_ID varchar(50) not null,       /*동아리 공지사항 작성자*/
    CN_regDate datetime default now() not null, /*날짜*/
    CN_Content varchar(2000) not null,/*내용*/
    foreign key(CNC_Code) references Circles(C_Code),
    foreign key(CN_ID) references User(UID)
);

create table CN_Reply(
    CRCN_Code varchar(50) not null,     /*동아리FK*/
    CR_ID varchar(50) not null,         /*작성자 아이디*/
    CR_regDate datetime default now() not null, /*날짜*/
    CR_Content varchar(2000) not null,  /*내용*/
    CR_No int primary key,              /*NO*/
    foreign key(CRCN_Code) references Circles(C_Code),
    foreign key(CR_ID) references User(UID)
);

create table Circles_Board(
    CBC_Code varchar(50) not null,  /*동아리FK*/
    CB_NO int primary key,          /*NO*/
    CB_Title varchar(20) not null,  /*제목*/
    CB_ID varchar(50) not null,     /*아이디*/
    CB_regDate datetime default now() not null,/*날짜*/
    CB_Content varchar(2000) not null, /*내용*/
    foreign key(CBC_Code) references Circles(C_Code),
    foreign key(CB_ID) references User(UID)
);


create table CB_Reply(
    CRCB_Code varchar(50) not null,   /*동아리FK*/
    CR_ID varchar(50) not null,       /*아이디*/
    CR_regDate datetime default now(),/*날짜*/
    CR_Content varchar(2000) not null,/*내용*/
    CR_NO int primary key,            /*NO*/
    foreign key(CRCB_Code) references Circles(C_Code),
    foreign key(CR_ID) references User(UID)
);

create table Calendar( 
    Cal_ID varchar(50) not null,   /*사람FK*/
    Cal_Title varchar(20) not null,/*제목*/
    Cal_Stime date not null,       /*시작시간*/
    Cal_Etime date not null,       /*종료시간*/
    Cal_Content varchar(2000) not null, /*내용*/
    Cal_Place nvarchar(200),       /*장소*/
    Cal_ShareChk char(5) not null, /*공유여부*/
    Cal_ScheduleChk varchar(10) not null, /*모집 일정 여부*/
    Cal_NO int primary key         /*NO*/
);