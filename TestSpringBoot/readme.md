# 1

本專案為 Spring Boot 專案，實作 Spring Data JPA
參考 Git 為 https://github.com/Java-Hub18/SpringBootImageUpload

目前實作部分

1. Spring Boot JPA
2. 圖片上傳(含預覽)至資料庫，查詢時再連結 Controller 匯出至 Resouce 資料夾下讀取檔案(路徑變數)，最後利用 HttpServletResponse response 回傳至 JSP
3. 上傳檔案部分使用 Jquery 實作 Ajax 新增
4. Jquery Data Table plug in 實作
5. 刪除寫完 AJAX
6. 修改+查詢寫完
   其他小地方自己看啦有備註
   起始路徑為

   http://localhost:7070/petpet/upload

8/1 實作活動後台版面完畢

1. 與線上廣告活動版型調整完畢
2. 版面結合一致(搜尋欄位未完成)
3. 線上廣告活動多重刪除 Checkbox 功能增加(感謝學姊)
4. 點閱次數實作
5. 活動起始日期(input time 自動帶入欄位)
6. Google Place autocomplete (寫的時候請注意)
7. 各種版面調整
   起始路徑為 http://localhost:7070/petpet/queryallevent.controller

8/3

1. 新增活動成員刪除欄位(Spring JPA 多對多)
2. 活動後臺增加顯示多位成員欄位
3. 檢測成員是否多重參加同一活動
4. 新增頁面

event SQL 如下

USE [petpet]
GO
/**\*\*** Object: Table [dbo].[event] Script Date: 2021/8/1 下午 04:45:25 **\*\***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event](
[eventid] [bigint] IDENTITY(100001,1) NOT NULL,
[hostid] [int] NOT NULL,
[eventname] [nvarchar](25) NOT NULL,
[eventstarttime] [datetime] NOT NULL,
[eventendtime] [datetime] NOT NULL,
[eventlocation] [nvarchar](40) NOT NULL,
[eventpicture] [varbinary](max) NULL,
[eventtype] [nvarchar](6) NOT NULL,
[eventmaxlimit] [int] NULL,
[eventfee] [int] NULL,
[eventstatus] [bit] NULL,
[eventdescription] [nvarchar](250) NULL,
[eventclick] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SQL 指令為
USE [petpet]
GO
/**\*\*** Object: Table [dbo].[product] Script Date: 2021/7/25 下午 03:36:02 **\*\***/
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
