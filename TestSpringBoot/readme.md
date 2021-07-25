# 1 

本專案為 Spring Boot專案，實作Spring Data JPA 
參考Git為 https://github.com/Java-Hub18/SpringBootImageUpload

目前實作部分
1. Spring Boot JPA
2. 圖片上傳(含預覽)至資料庫，查詢時再連結Controller匯出至Resouce資料夾下讀取檔案(路徑變數)，最後利用HttpServletResponse response回傳至JSP
3. 上傳檔案部分使用Jquery實作Ajax新增
4. Jquery Data Table plug in實作
5. 待增加 AJAX 刪除修改明細...應該吧，怎麼做啊
6. 其他小地方自己看啦有備註
起始路徑為
http://localhost:7070/petpet/upload

SQL指令為
USE [petpet]
GO
/****** Object:  Table [dbo].[product]    Script Date: 2021/7/25 下午 03:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[createtime] [datetime2](7) NOT NULL,
	[productdescription] [varchar](255) NULL,
	[productimage] [varbinary](max) NULL,
	[productname] [varchar](255) NOT NULL,
	[productprice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO