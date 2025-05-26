-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: Plantopia
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `c_idx` int NOT NULL AUTO_INCREMENT,
  `c_amount` int NOT NULL,
  `c_img` varchar(100) NOT NULL,
  `c_price` int NOT NULL,
  `p_idx` int DEFAULT NULL,
  `user_num` int DEFAULT NULL,
  PRIMARY KEY (`c_idx`),
  KEY `p_idx` (`p_idx`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`p_idx`) REFERENCES `store` (`p_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_ratings`
--

DROP TABLE IF EXISTS `comment_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_ratings` (
  `cr_idx` int NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `user_num` int DEFAULT NULL,
  `plccom_idx` int DEFAULT NULL,
  PRIMARY KEY (`cr_idx`),
  UNIQUE KEY `user_num` (`user_num`,`plccom_idx`),
  KEY `plccom_idx` (`plccom_idx`),
  CONSTRAINT `comment_ratings_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ratings_ibfk_2` FOREIGN KEY (`plccom_idx`) REFERENCES `plantclinic_comment` (`plccom_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ratings_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_ratings`
--

LOCK TABLES `comment_ratings` WRITE;
/*!40000 ALTER TABLE `comment_ratings` DISABLE KEYS */;
INSERT INTO `comment_ratings` VALUES (1,4,2,1),(2,5,3,3),(3,4,4,5),(4,3,5,7),(5,4,6,10),(6,5,7,13),(7,4,6,13),(8,3,10,16),(9,4,7,16),(10,4,8,19),(11,4,7,19),(12,5,9,22),(13,4,10,22),(14,4,11,25),(15,5,2,22),(16,5,3,1),(17,5,3,28),(18,5,4,31);
/*!40000 ALTER TABLE `comment_ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = euckr */ ;
/*!50003 SET character_set_results = euckr */ ;
/*!50003 SET collation_connection  = euckr_korean_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_average_rating_after_insert` AFTER INSERT ON `comment_ratings` FOR EACH ROW BEGIN
    UPDATE PlantClinic_Comment
    SET average_rating = (
        SELECT AVG(rating) 
        FROM comment_ratings 
        WHERE plccom_idx = NEW.plccom_idx
    )
    WHERE plccom_idx = NEW.plccom_idx;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = euckr */ ;
/*!50003 SET character_set_results = euckr */ ;
/*!50003 SET collation_connection  = euckr_korean_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_average_rating_after_update` AFTER UPDATE ON `comment_ratings` FOR EACH ROW BEGIN
    UPDATE PlantClinic_Comment
    SET average_rating = (
        SELECT AVG(rating) 
        FROM comment_ratings 
        WHERE plccom_idx = NEW.plccom_idx
    )
    WHERE plccom_idx = NEW.plccom_idx;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = euckr */ ;
/*!50003 SET character_set_results = euckr */ ;
/*!50003 SET collation_connection  = euckr_korean_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_average_rating_after_delete` AFTER DELETE ON `comment_ratings` FOR EACH ROW BEGIN
    UPDATE PlantClinic_Comment
    SET average_rating = (
        SELECT AVG(rating) 
        FROM comment_ratings 
        WHERE plccom_idx = OLD.plccom_idx
    )
    WHERE plccom_idx = OLD.plccom_idx;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `n_idx` int NOT NULL AUTO_INCREMENT,
  `n_title` varchar(100) NOT NULL,
  `n_contents` text NOT NULL,
  `n_img` varchar(100) DEFAULT NULL,
  `n_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'🔔 [이벤트 안내] 인스타그램 팔로우하고 10% 할인받자!','안녕하세요, Plantopia입니다!\r\n고객 여러분의 성원에 감사드리며, 특별한 인스타그램 이벤트를 준비했습니다. 🎉\r\n\r\n📌 이벤트 내용\r\nPlantopia 공식 인스타그램 계정을 팔로우하신 분들 중 추첨을 통해 10분께\r\n스토어 10% 할인권을 드립니다!\r\n\r\n📌 참여 방법\r\n1. 인스타그램에서 @plantopia_official 계정을 팔로우\r\n2. 매장 방문 시 또는 DM으로 팔로우 인증\r\n3. 추첨을 통해 당첨자 개별 연락\r\n\r\n📌 이벤트 기간\r\n~ 2025년 6월 30일까지\r\n\r\n📌 당첨자 발표\r\n2025년 7월 3일 (인스타그램 및 홈페이지 공지 예정)\r\n\r\n많은 참여 부탁드리며, 앞으로도 Plantopia는 더 좋은 혜택으로 찾아뵙겠습니다.\r\n감사합니다! 🌿','ChatGPT Image 2025년 5월 21일 오후 03_54_22.png','2025-05-22 12:06:18'),(2,'✅ [공지] Plantopia 오프라인 스토어 정식 오픈 안내','안녕하세요, Plantopia입니다.\r\n드디어 많은 분들이 기다려주신 Plantopia 오프라인 매장이 서울에 정식 오픈했습니다! 🏪\r\n\r\n📍 위치\r\n서울특별시 성동구 성수일로 123, 플랜토피아 스토어\r\n\r\n🕒 운영 시간\r\n평일 09:00–18:00\r\n\r\n📌 매장에서 직접 식물을 보고 구매하실 수 있으며,\r\n전문 식물 큐레이터의 1:1 상담도 제공해드립니다.\r\n\r\n🎁 오픈 기념 방문 고객 전원에게 사은품 증정 이벤트도 진행 중!\r\n많은 방문 부탁드립니다.','seoulmap.png','2025-05-22 12:43:26'),(3,'📌 [공지] Plantopia 사이트 운영 규칙 안내','안녕하세요, Plantopia입니다.\r\n고객 여러분께 보다 나은 서비스 제공과 쾌적한 커뮤니티 환경 유지를 위해\r\n다음과 같은 사이트 운영 규칙을 안내드립니다.\r\n\r\n📖 1. 회원 정보 관리\r\n\r\n가입 시 정확한 정보를 입력해 주세요.\r\n\r\n타인의 정보를 도용하거나 허위 정보 입력 시 이용이 제한될 수 있습니다.\r\n\r\n📖 2. 게시판 이용 수칙\r\n\r\n욕설, 비방, 허위 사실 유포 등 타인에게 피해를 주는 게시글은 금지됩니다.\r\n\r\n상업성 광고, 도배성 글, 불법 콘텐츠 등록 시 사전 경고 없이 삭제될 수 있습니다.\r\n\r\n📖 3. 저작권 및 이미지 사용\r\n\r\n게시물 작성 시 타인의 콘텐츠(이미지, 글 등)를 무단으로 사용하지 말아 주세요.\r\n\r\n타인의 저작물을 인용할 경우 출처를 반드시 명시해 주세요.\r\n\r\n📖 4. 이용 제한 및 탈퇴\r\n\r\n운영 방침을 반복적으로 위반할 경우 경고 없이 이용이 제한될 수 있습니다.\r\n\r\n회원 탈퇴는 [마이페이지 > 회원탈퇴]에서 직접 처리하실 수 있습니다.\r\n\r\nPlantopia는 모든 이용자분들이 신뢰할 수 있는 플랫폼을 만들기 위해 최선을 다하겠습니다.\r\n운영 규칙을 준수하여 건강한 커뮤니티 문화를 함께 만들어 주세요.\r\n감사합니다. 🌿','ChatGPT Image 2025년 5월 22일 오후 01_54_29.png','2025-05-22 13:56:02');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant`
--

DROP TABLE IF EXISTS `plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant` (
  `pla_idx` int NOT NULL AUTO_INCREMENT,
  `pla_title` varchar(100) NOT NULL,
  `pla_contents` text NOT NULL,
  `pla_img` varchar(100) DEFAULT NULL,
  `pla_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pla_hit_cnt` int NOT NULL DEFAULT '0',
  `user_num` int DEFAULT NULL,
  PRIMARY KEY (`pla_idx`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `plant_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant`
--

LOCK TABLES `plant` WRITE;
/*!40000 ALTER TABLE `plant` DISABLE KEYS */;
INSERT INTO `plant` VALUES (1,'드디어 새잎이 났어요!','몇 주 동안 별 변화가 없길래 걱정했는데, 오늘 아침에 보니 작고 연한 초록빛 새잎이 얼굴을 내밀었어요! 햇빛도 적당히 들고, 물도 규칙적으로 줬더니 이렇게 반응해주네요. 마치 식물이 저에게 “고마워요”라고 말해주는 느낌이 들어 너무 뿌듯했어요. 이 작은 생명의 변화가 이렇게 큰 기쁨을 줄 줄 몰랐습니다. 💚','수선화1.jpg','2025-05-22 10:45:08',12,2),(2,'몬스테라가 점점 커져요 🌿','처음에 데려왔을 땐 손바닥만 한 몬스테라였는데, 지금은 제 얼굴보다 더 커졌답니다. 매일 아침마다 잎이 조금씩 펼쳐지고, 새로운 잎이 올라오는 모습을 보며 하루를 시작하고 있어요. 식물 하나가 이렇게 집안을 풍성하게 만들고, 마음도 안정시켜줄 수 있다는 걸 이번에 처음 느꼈습니다. 몬스테라 추천해요!','몬스테라.jpg','2025-05-22 10:36:00',11,3),(3,'꽃이 폈어요!','반려식물을 키우면서 가장 기다리던 순간이 찾아왔어요. 바로 ‘꽃 피는 날’입니다. 키운 지 3개월 만에 처음으로 작은 꽃봉오리가 생겼고, 오늘 아침 드디어 활짝 폈습니다. 핑크빛이 감도는 그 작고 소중한 꽃이 집안 한쪽을 환하게 밝혀주네요. 사진도 같이 올려요! 🌸','프리지아&장미.jpg','2025-05-22 10:41:54',15,4),(4,'새 화분으로 이사시켰어요','뿌리가 화분 아래까지 닿아 있는 걸 보고는 큰맘 먹고 분갈이를 했어요. 처음 해보는 거라 무척 긴장했지만, 생각보다 잘 적응해서 다행입니다. 새 화분은 좀 더 넓고 통기성이 좋아서 그런지 식물이 훨씬 활기차 보이고, 잎색도 더 진해졌어요. 이사 축하 파티라도 해주고 싶네요 ㅎㅎ','문샤인.jpg','2025-05-22 10:45:43',12,5),(5,'식물이 저보다 부지런하네요 😅','아침에 커튼을 열면 매번 다른 방향으로 잎이 틀어져 있어요. 햇빛이 드는 방향을 따라 몸을 틀고 있다는 걸 알고는 감탄이 나왔습니다. 아무 말도 하지 않지만 묵묵히 자기 할 일을 하고 있는 모습이 꼭 부지런한 친구 같아요. 오늘도 그 초록색 잎에게 한 수 배웁니다.','쬐간한올리브나무.jpg','2025-05-22 10:42:01',14,6),(6,'물 주기 테스트 성공!','처음엔 너무 자주 물을 줘서 과습으로 잎이 누렇게 변했었어요. 그래서 요즘은 흙이 마를 때까지 기다렸다가 주는 방법으로 바꿨더니, 식물이 점점 건강해지고 있어요! 특히 잎 끝이 더 이상 말리지 않고 촉촉함을 유지하는 걸 보면, 확실히 수분 조절이 중요하다는 걸 느껴요.','난초.jpg','2025-05-22 10:36:54',9,7),(7,'첫 식물 키우기 성공기','식물은 한 번도 제대로 키워본 적이 없어서 걱정이 많았어요. 근데 이번에 용기내서 들인 이 아이가 생각보다 잘 자라줘서 고마운 마음이 커요. 처음엔 언제 물을 줘야 할지 몰라 긴장하고, 잎 하나 떨어질 때마다 좌절했지만, 지금은 자신감도 생겼습니다.','미니금사철.jpg','2025-05-22 10:45:04',16,10),(8,'거실 분위기 메이커','식물 하나로 이렇게 분위기가 달라질 수 있다는 걸 몰랐어요. 처음엔 공간이 조금 휑한 느낌이었는데, 이 친구가 들어오고 나서는 거실이 훨씬 따뜻하고 생기있어졌어요. 손님들도 오면 예쁘다고 해주고, 무엇보다 집에서 힐링을 더 깊이 느낄 수 있어서 만족감이 커요.','반려식물자랑.jpg','2025-05-22 10:43:35',15,8),(9,'초보도 할 수 있다!','“식물 키우기 어렵다”는 말만 듣고 망설였는데, 직접 해보니까 전혀 그렇지 않더라고요. 물론 처음엔 몰라서 잎을 떨어뜨리기도 했지만, 금방 다시 건강해졌어요. 중요한 건 관심과 정성이라는 걸 새삼 느꼈어요. 저처럼 초보이신 분들께 식물 키우는 걸 꼭 추천드리고 싶어요.','바질이.jpeg','2025-05-22 10:36:49',9,9),(10,'선물받은 다육이의 변신','친구한테 생일 선물로 받은 조그만 다육이를 책상에 놓고 키운 지 어느덧 두 달. 처음엔 손가락만 했던 아이가 이젠 손바닥만 해졌고, 잎 색깔도 훨씬 선명하고 탱탱해졌어요. 하루에 한 번 눈 마주치는 것만으로도 기분이 좋아지고, 식물 하나로 이렇게 감정을 나눌 수 있다는 걸 알게 됐어요.','사무실다육이.jpg','2025-05-22 10:45:01',15,11),(11,'매일 아침 인사해요','아침에 눈뜨면 가장 먼저 하는 일이 식물에게 “잘 잤어?”라고 인사하는 거예요. 혼자 사는 집이지만, 식물이 있어 외롭지 않아요. 물 줄 때마다 반짝이는 잎을 보면 “나도 잘 지내고 있어요”라고 말해주는 것 같거든요. 이 작은 인사가 어느새 제 하루의 활력이 되었답니다.','반려식물힐링.jpg','2025-05-22 10:37:44',6,2),(13,'봄맞이 새 잎 출현!','겨울엔 조금 시들해 보이던 아이가 봄바람이 불기 시작하자 새 잎을 하나둘 피우기 시작했어요. 연초록빛으로 올라오는 그 모습이 얼마나 예쁘고 생기 넘치는지… 식물도 계절을 느끼고 준비하나 봐요.','드라코.jpeg','2025-05-22 10:34:55',1,3),(14,'잎사귀에 윤기가 좌르르~','주말마다 물 한 번 주고, 부드러운 천으로 잎을 조심스럽게 닦아줘요. 그랬더니 잎이 반짝반짝 윤이 나면서 훨씬 건강해 보이는 거 있죠? 마치 피부 관리처럼 식물에게도 관리가 필요하다는 걸 느꼈어요.','무늬백일홍.jpg','2025-05-22 10:34:41',1,4),(15,'아보카도 씨앗 발아 성공 🌱','먹고 남은 아보카도 씨앗을 심은 지 한 달쯤 됐는데, 드디어 갈라지면서 싹이 올라왔어요! 매일매일 조금씩 자라는 걸 보는 게 얼마나 설레는 일인지 몰라요.','아보카도.jpg','2025-05-22 10:34:45',2,5),(16,'식물이 제 마음을 알아주는 느낌이에요','일이 너무 바쁜 날에는 물 주는 걸 까먹기도 했는데, 이상하게도 제가 지친 날엔 얘도 기운 없어 보이고, 제가 기분 좋은 날엔 얘도 더 활기차 보여요. 정말 마음이 통하는 걸까요?','만세선인장.jpeg','2025-05-22 10:41:12',6,6),(17,'오늘도 잎이 한 장 더!','요즘은 매일 아침 일어나면 식물부터 봐요. 어제보다 더 커진 잎, 새로 돋아난 새싹을 볼 때마다 하루가 기분 좋게 시작되거든요.','줄리아페페.jpeg','2025-05-22 10:35:09',8,7),(18,'창문 자리 최고 명당이에요','해가 잘 드는 창문 옆으로 자리를 옮겨줬더니 갑자기 식물이 생기발랄해졌어요. 잎이 더 크고 진해졌고, 새싹도 부지런히 올라와요.','무늬홍콩야자.jpg','2025-05-22 10:34:12',1,10),(19,'퇴근 후 힐링 루틴','하루 종일 모니터만 보며 지친 눈과 몸이지만, 퇴근 후 식물에 물을 주고 잎을 만지는 그 몇 분이 저에게는 최고의 휴식이에요.','만리향.jpg','2025-05-22 10:45:52',15,8),(20,'분갈이 대성공!','뿌리가 꽉 찼다는 말을 듣고 용기 내서 분갈이에 도전했어요. 흙도 새로 사서 좋은 걸로 써줬고, 물 배수도 잘되게 자갈도 깔았답니다.','제라늄.jpeg','2025-05-22 10:41:45',3,9),(22,'드디어 벽걸이 플랜터 설치!','천장 가까이에 걸 수 있는 플랜터를 설치했어요. 밑으로 축 늘어진 식물이 마치 자연의 커튼 같아요. 공간도 절약되고, 인테리어 효과도 만점!','벽걸이 플랜터.jpg','2025-05-22 10:40:37',5,11);
/*!40000 ALTER TABLE `plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_comment`
--

DROP TABLE IF EXISTS `plant_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_comment` (
  `placom_idx` int NOT NULL AUTO_INCREMENT,
  `placom_contents` varchar(200) NOT NULL,
  `placom_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `placom_root` int DEFAULT NULL,
  `placom_step` int DEFAULT NULL,
  `placom_indent` int DEFAULT NULL,
  `user_num` int DEFAULT NULL,
  `pla_idx` int DEFAULT NULL,
  PRIMARY KEY (`placom_idx`),
  KEY `user_num` (`user_num`),
  KEY `pla_idx` (`pla_idx`),
  CONSTRAINT `plant_comment_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plant_comment_ibfk_2` FOREIGN KEY (`pla_idx`) REFERENCES `plant` (`pla_idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_comment`
--

LOCK TABLES `plant_comment` WRITE;
/*!40000 ALTER TABLE `plant_comment` DISABLE KEYS */;
INSERT INTO `plant_comment` VALUES (1,'건강해 보여서 보기 좋아요!','2025-05-22 09:17:44',1,0,0,3,1),(2,'맞아요! 정말 매력있죠?','2025-05-22 09:20:13',1,2,1,2,1),(3,'정말 예쁘네요! (logintest3)','2025-05-22 09:19:39',3,0,0,4,1),(4,'더 예쁘게 키워볼게요~','2025-05-22 09:20:13',3,1,1,2,1),(5,'이런 식물 키워보고 싶어요~','2025-05-22 09:23:18',5,0,0,4,2),(6,'정성껏 키운 보람이 있네요!','2025-05-22 09:28:23',5,2,1,3,2),(7,'잎 색이 너무 예뻐요!','2025-05-22 09:27:57',7,0,0,5,2),(8,'맞아요! 정말 매력있죠?','2025-05-22 09:28:23',7,1,1,3,2),(9,'꽃잎이 너무 예뻐요!','2025-05-22 09:29:52',9,0,0,5,3),(10,'정성껏 키운 보람이 있네요!','2025-05-22 09:31:21',9,2,1,4,3),(11,'반려식물 사랑이 느껴져요~','2025-05-22 09:30:59',11,0,0,6,3),(12,'감사합니다~','2025-05-22 09:31:21',11,1,1,4,3),(13,'화분이랑 식물이 찰떡궁합이에요!','2025-05-22 09:34:19',13,0,0,6,4),(14,'더 예쁘게 키워볼게요~','2025-05-22 09:35:56',13,2,1,5,4),(15,'화분이랑 식물이 잘어울려요!','2025-05-22 09:35:32',15,0,0,7,4),(16,'관심 가져주셔서 감사해요!','2025-05-22 09:35:56',15,1,1,5,4),(17,'햇빛 아래 모습이 멋져요!','2025-05-22 09:37:41',17,0,0,7,5),(18,'이 식물 강추드려요~','2025-05-22 09:41:19',17,2,1,6,5),(19,'너무 귀여워요!','2025-05-22 09:40:57',19,0,0,10,5),(20,'응원해주셔서 감사해요!','2025-05-22 09:41:19',19,1,1,6,5),(21,'건강해 보여서 보기 좋아요!','2025-05-22 09:43:09',21,0,0,10,6),(22,'정성스럽게 키우신 게 느껴져요!','2025-05-22 09:43:41',22,0,0,8,6),(23,'감사합니다~','2025-05-22 09:44:14',21,2,1,7,6),(24,'더 예쁘게 키워볼게요~','2025-05-22 09:44:14',22,1,1,7,6),(25,'건강해 보여서 보기 좋아요!','2025-05-22 09:46:33',25,0,0,8,7),(26,'처음치곤 잘하셨어요!','2025-05-22 09:47:16',26,0,0,9,7),(27,'칭찬해주셔서 기뻐요!','2025-05-22 09:50:46',25,3,1,10,7),(28,'관심 가져주셔서 감사해요!','2025-05-22 09:50:46',26,2,1,10,7),(29,'너무 귀여워요!','2025-05-22 09:50:25',29,0,0,11,7),(30,'정성껏 키운 보람이 있네요!','2025-05-22 09:50:46',29,1,1,10,7),(31,'잎 색이 너무 예뻐요!','2025-05-22 09:54:28',31,0,0,9,8),(32,'정성스럽게 키우신 게 느껴져요!','2025-05-22 09:55:34',32,0,0,11,8),(33,'더 예쁘게 키워볼게요~','2025-05-22 09:56:05',31,2,1,8,8),(34,'맞아요! 정말 매력있죠?','2025-05-22 09:56:05',32,1,1,8,8),(35,'건강해 보여서 보기 좋아요!','2025-05-22 10:04:09',35,0,0,11,9),(36,'반려식물 사랑이 느껴져요~','2025-05-22 10:04:28',36,0,0,2,9),(37,'관리 어렵지 않아서 추천드려요!','2025-05-22 10:04:55',35,2,1,9,9),(38,'더 예쁘게 키워볼게요~','2025-05-22 10:04:55',36,1,1,9,9),(39,'정말 예쁘네요!','2025-05-22 10:07:18',39,0,0,2,10),(40,'잎 색이 너무 예뻐요!','2025-05-22 10:07:35',40,0,0,3,10),(41,'이 식물 강추드려요~','2025-05-22 10:08:44',39,2,1,11,10),(42,'정성껏 키운 보람이 있네요!','2025-05-22 10:08:44',40,1,1,11,10),(43,'반려식물 사랑이 느껴져요~','2025-05-22 10:33:38',43,0,0,11,11),(44,'와, 너무 잘 키우셨어요!','2025-05-22 10:42:33',44,0,0,7,19),(45,'감사합니다~','2025-05-22 10:44:52',44,2,1,8,19),(46,'정성스럽게 키우신 게 느껴져요!','2025-05-22 10:44:35',46,0,0,4,19),(47,'더 예쁘게 키워볼게요~','2025-05-22 10:44:52',46,1,1,8,19);
/*!40000 ALTER TABLE `plant_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantclinic`
--

DROP TABLE IF EXISTS `plantclinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantclinic` (
  `plc_idx` int NOT NULL AUTO_INCREMENT,
  `plc_title` varchar(100) NOT NULL,
  `growing_loc` varchar(50) NOT NULL,
  `growth_con` varchar(50) NOT NULL,
  `watering` varchar(50) NOT NULL,
  `last_rep` varchar(50) NOT NULL,
  `last_fert` varchar(50) NOT NULL,
  `last_pruned` varchar(50) NOT NULL,
  `plant_pos` varchar(50) NOT NULL,
  `pest_dmg` varchar(50) NOT NULL,
  `discolored` varchar(50) NOT NULL,
  `plc_contents` text NOT NULL,
  `plc_img` varchar(100) DEFAULT NULL,
  `plc_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `plc_hit_cnt` int NOT NULL DEFAULT '0',
  `user_num` int DEFAULT NULL,
  PRIMARY KEY (`plc_idx`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `plantclinic_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantclinic`
--

LOCK TABLES `plantclinic` WRITE;
/*!40000 ALTER TABLE `plantclinic` DISABLE KEYS */;
INSERT INTO `plantclinic` VALUES (1,'겹미나리 아재비 삽목방법','실외','양지','주기적으로 한 번씩','없음','6개월 이상','1년 이상','제주도','잘 모르겠어요','거의 멀쩡해요','겹미나리 아재비 삽목방법이 뭔지요?','겹미나리아재비2.jpg','2025-05-22 11:57:04',8,2),(2,'고무나무 잎인데 왜이런건가요','실내','양지','조금씩 자주','2년 이내','6개월 이상','2주 이내','실내','잘 모르겠어요','시든 잎이 조금 있어요','고무나무 잎인데 뒷면이 왜 이런건가요?','고무나무2.jpg','2025-05-22 11:22:38',8,3),(3,'금전수 관리','실내','음지','흙이 충분히 마른 후 듬뿍','없음','6개월 이상','1년 이상','실내','잘 모르겠어요','시든 잎이 조금 있어요','양 옆에 있는 잎이 노래졌어요','금전수2.jpg','2025-05-22 11:35:23',4,4),(4,'몬스테라 잎이 노랗게 변하고 있어요','실내 거실','간접광, 적당한 습도','일주일에 한 번','6개월 전','3개월 전','1년 전','창가 근처','없음','있음 (노란색)','최근 몬스테라 잎 몇 장이 노랗게 변하고 떨어지기 시작했어요. 햇빛이나 물이 문제일까요? 해결 방법 부탁드려요.','몬스테라 노랗게.jpg','2025-05-22 11:38:51',8,5),(5,'산세베리아가 너무 시들어요','베란다','직사광선','2주에 한 번','없음','1년 전','없음','남향 창문 앞','잘 모르겠어요','있음 (갈색)','산세베리아 잎 끝이 갈색으로 변하면서 시들어가고 있어요. 어떻게 하면 살릴 수 있을까요?','산세베리아 시든.png','2025-05-22 11:41:15',6,6),(6,'칼라디움 잎이 다 말라버렸어요','실내 방 한켠','간접광, 낮은 습도','겉흙이 마르면','1년 전','없음','없음','책상 옆','없음','있음 (갈변)','칼라디움 잎이 갈색으로 변하더니 다 말라버렸어요. 다시 새 잎이 날 수 있을까요?','칼라디움 잎이 말라.png','2025-05-22 11:43:44',7,7),(7,'테이블야자 잎 끝이 계속 마르고 있어요','실내 창가','간접광, 습도 낮음','5일에 한 번','3개월 전','1개월 전','없음','커튼 뒤쪽','없음','(잎 끝 갈변)','테이블야자 잎 끝이 갈색으로 변하면서 점점 말라가고 있어요. 원인이 뭘까요? 조언 부탁드려요.','테이블야자 잎 마름.png','2025-05-22 11:46:30',6,10),(8,'오레가노 잎이 축 처져요','아이 방','부분적으로 햇빛','일주일에 한 번','6개월 전','3개월 전','1년 전','창가 근처','잘 모르겠어요','있음 (흰색 반점)','오레가노를 키우고 있는데, 잎에 힘이 없고 축 처져 있어요. 무엇이 문제인지 모르겠어요. 도와주세요.','오레가노 잎이 축.png','2025-05-22 11:49:30',7,8),(9,'필로덴드론 잎 끝이 갈색이에요','회사 사무실','부분적으로 햇빛','5일에 한 번','2년 전','3개월 전','1개월 전','선풍기 아래','잘 모르겠어요','있음 (갈색)','필로덴드론를 키우고 있는데, 잎 끝이 갈색으로 말라가고 있어요. 무엇이 문제인지 모르겠어요. 도와주세요.','필로덴드론 잎 끝이 갈색.png','2025-05-22 11:57:21',10,9),(10,'알로카시아 잎이 찢어졌어요','실내 거실','직사광선','2주에 한 번','2년 전','1년 전','1년 전','선풍기 아래','잘 모르겠어요','있음 (갈색)','알로카시아를 키우고 있는데, 잎이 자연스럽게 찢어져 있는데 왜 그런 걸까요? 무엇이 문제인지 모르겠어요. 도와주세요.','알로카시아 잎이.png','2025-05-22 11:55:15',6,11),(11,'파리지옥 새순이 안 나와요','아이 방','직사광선','일주일에 한 번','없음','1개월 전','없음','선풍기 아래','잎 뒷면에 벌레 발견','있음 (흰색 반점)','파리지옥를 키우고 있는데, 새 잎이 잘 안 나고 있어요. 무엇이 문제인지 모르겠어요. 도와주세요.','파리지옥이.jpg','2025-05-22 12:07:38',7,3),(12,'라벤더 성장이 멈췄어요','침실','직사광선','겉흙이 마르면','2년 전','1개월 전','6개월 전','난방기 옆','없음','있음 (흰색 반점)','라벤더를 키우고 있는데, 최근에 성장이 멈춘 느낌이에요. 무엇이 문제인지 모르겠어요. 도와주세요.','라벤더 성장이.png','2025-05-22 12:07:41',5,4);
/*!40000 ALTER TABLE `plantclinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantclinic_comment`
--

DROP TABLE IF EXISTS `plantclinic_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantclinic_comment` (
  `plccom_idx` int NOT NULL AUTO_INCREMENT,
  `plccom_contents` varchar(200) NOT NULL,
  `plccom_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `plccom_root` int DEFAULT NULL,
  `plccom_step` int DEFAULT NULL,
  `plccom_indent` int DEFAULT NULL,
  `average_rating` double DEFAULT '0',
  `plc_idx` int DEFAULT NULL,
  `user_num` int DEFAULT NULL,
  PRIMARY KEY (`plccom_idx`),
  KEY `plc_idx` (`plc_idx`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `plantclinic_comment_ibfk_1` FOREIGN KEY (`plc_idx`) REFERENCES `plantclinic` (`plc_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plantclinic_comment_ibfk_2` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantclinic_comment`
--

LOCK TABLES `plantclinic_comment` WRITE;
/*!40000 ALTER TABLE `plantclinic_comment` DISABLE KEYS */;
INSERT INTO `plantclinic_comment` VALUES (1,'기냥 삽째로 퍼와서 화분에 키우세요\r\n그냥 풀이라서 잘자라요','2025-05-22 11:56:21',1,0,0,4.5,1,3),(2,'답변 감사합니다 ^^','2025-05-22 11:08:09',1,1,2,0,1,2),(3,'총채벌레 흡즙 흔적입니다.\r\n식물에 벌레 알이 박혀있고, 유충과 성충은\r\n잎을 흡즙하며 번데기는 흙 속에 있어 골치아픈 벌레죠.\r\n\r\n잎에 뿌리는 약과 흙에 뿌리는 약을 따로 구해\r\n처리하시면 방제가 좀 수월해져요.','2025-05-22 11:22:40',3,0,0,5,2,4),(4,'아 그렇군요. 감사합니다^^','2025-05-22 11:22:38',3,1,2,0,2,3),(5,'과습으로 보여요. 금전수는 물을 좋아하지 않아요.','2025-05-22 11:35:21',5,0,0,4,3,5),(6,'유익해요! 도움이 많이 되었어요.','2025-05-22 11:35:23',5,1,2,0,3,4),(7,'비료 성분이 쌓인 걸 수 있어요. 물로 잘 씻어내 주세요.','2025-05-22 11:37:53',7,0,0,3,4,6),(8,'감사합니다~ 참고할게요!\r\n','2025-05-22 11:38:51',7,2,2,0,4,5),(9,'저도 같은 문제 있었는데 도움 됐어요.','2025-05-22 11:38:51',8,1,4,0,4,4),(10,'직사광선이 강하면 잎이 탈 수 있어요. 반그늘로 옮겨보세요.','2025-05-22 11:40:48',10,0,0,4,5,7),(11,'좋은 팁이네요. 옮겨볼게요.','2025-05-22 11:41:15',10,2,2,0,5,6),(12,'우리 집 식물도 비슷했어요. 감사합니다!','2025-05-22 11:41:15',11,1,4,0,5,5),(13,'응애가 생기면 젖은 면봉으로 닦아내고 방제제를 사용하세요.','2025-05-22 11:43:47',13,0,0,4.5,6,10),(14,'상세한 설명 감사합니다~','2025-05-22 11:43:44',13,2,2,0,6,7),(15,'면봉 방법 몰랐는데 해봐야겠어요!','2025-05-22 11:43:44',14,1,4,0,6,6),(16,'겨울철에는 물 주는 횟수를 줄이고 햇빛을 더 많이 주세요.','2025-05-22 11:46:27',16,0,0,3.5,7,8),(17,'겨울 관리법 고민했는데 감사합니다.','2025-05-22 11:46:30',16,2,2,0,7,10),(18,'지금 딱 필요했던 정보네요!','2025-05-22 11:46:30',17,1,4,0,7,7),(19,'뿌리가 흙 위로 나오는 건 분갈이 시기라는 신호일 수 있어요.','2025-05-22 11:49:10',19,0,0,4,8,10),(20,'분갈이 시점 고민 중이었는데 도움 됐어요!','2025-05-22 11:49:30',19,2,2,0,8,8),(21,'좋은 정보네요. 바로 해야겠어요.','2025-05-22 11:49:30',20,1,4,0,8,7),(22,'잎 끝이 마른다면 건조하거나 비료 과다일 수 있어요.','2025-05-22 11:55:46',22,0,0,4.67,9,8),(23,'아, 비료 많이 줬던 게 원인 같아요.','2025-05-22 11:52:14',22,2,2,0,9,9),(24,'다음부터 조심해야겠네요. 감사합니다!','2025-05-22 11:52:14',23,1,4,0,9,10),(25,'새잎이 금방 시드는 건 온도나 습도 문제일 수 있어요.','2025-05-22 11:53:55',25,0,0,4,10,9),(26,'실내 온도 조절해봐야겠어요.','2025-05-22 11:53:56',25,1,2,0,10,11),(27,'좋은 조언 감사합니다.','2025-05-22 11:54:07',25,2,2,0,10,11),(28,'식물에 물방울 맺히는 건 뿌리가 건강하다는 신호일 수도 있어요.','2025-05-22 11:59:05',28,0,0,5,11,2),(29,'걱정했는데 다행이에요!','2025-05-22 11:59:00',28,2,2,0,11,3),(30,'덕분에 안심했어요~','2025-05-22 11:59:00',29,1,4,0,11,3),(31,'화분 밑 배수 구멍을 막지 말고 물빠짐을 잘되게 해야 합니다.','2025-05-22 12:01:57',31,0,0,5,12,11),(32,'물빠짐 중요하군요. 확인해볼게요.','2025-05-22 12:01:57',31,1,2,0,12,4);
/*!40000 ALTER TABLE `plantclinic_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postlike`
--

DROP TABLE IF EXISTS `postlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postlike` (
  `pl_idx` int NOT NULL AUTO_INCREMENT,
  `pla_idx` int DEFAULT NULL,
  `user_num` int DEFAULT NULL,
  PRIMARY KEY (`pl_idx`),
  UNIQUE KEY `pla_idx` (`pla_idx`,`user_num`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `postlike_ibfk_1` FOREIGN KEY (`pla_idx`) REFERENCES `plant` (`pla_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postlike_ibfk_2` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postlike`
--

LOCK TABLES `postlike` WRITE;
/*!40000 ALTER TABLE `postlike` DISABLE KEYS */;
INSERT INTO `postlike` VALUES (29,1,3),(18,2,2),(19,3,2),(20,3,3),(35,3,4),(38,3,5),(50,3,6),(12,4,2),(26,4,3),(13,5,2),(25,5,3),(32,5,4),(41,5,5),(47,5,6),(14,6,2),(24,6,3),(15,7,2),(44,7,5),(46,7,6),(11,8,2),(21,8,3),(51,8,6),(55,8,7),(16,9,2),(23,9,3),(17,10,2),(22,10,3),(33,10,4),(40,10,5),(49,10,6),(28,11,3),(31,11,4),(1,11,11),(10,13,2),(9,14,2),(8,15,2),(7,16,2),(36,16,4),(37,16,5),(48,16,6),(54,16,7),(6,17,2),(5,18,2),(4,19,2),(27,19,3),(30,19,4),(42,19,5),(45,19,6),(53,19,7),(57,19,8),(3,20,2),(43,20,5),(56,20,7),(2,22,2),(34,22,4),(39,22,5),(52,22,6);
/*!40000 ALTER TABLE `postlike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `pro_num` int NOT NULL AUTO_INCREMENT,
  `pla_idx` int DEFAULT NULL,
  `plc_idx` int DEFAULT NULL,
  `user_num` int DEFAULT NULL,
  `cr_idx` int DEFAULT NULL,
  PRIMARY KEY (`pro_num`),
  KEY `pla_idx` (`pla_idx`),
  KEY `plc_idx` (`plc_idx`),
  KEY `user_num` (`user_num`),
  KEY `cr_idx` (`cr_idx`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`pla_idx`) REFERENCES `plant` (`pla_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`plc_idx`) REFERENCES `plantclinic` (`plc_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profile_ibfk_3` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profile_ibfk_4` FOREIGN KEY (`cr_idx`) REFERENCES `comment_ratings` (`cr_idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,NULL,NULL,2,NULL),(2,NULL,NULL,3,NULL),(3,NULL,NULL,4,NULL),(4,NULL,NULL,5,NULL),(5,NULL,NULL,6,NULL),(6,NULL,NULL,7,NULL),(7,NULL,NULL,8,NULL),(8,NULL,NULL,9,NULL),(9,NULL,NULL,10,NULL),(10,NULL,NULL,11,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `p_idx` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(100) NOT NULL,
  `p_img` varchar(100) NOT NULL,
  `p_price` int NOT NULL,
  `p_description` text NOT NULL,
  `p_stockQuantity` int NOT NULL,
  `p_addedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`p_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'겹작약/셜리템플','겹작약.jpg',45000,'연분홍 겹꽃이 피기 시작한 수입겹작약입니다.\r\n\r\n저희 화원에서 오래 머물러 있던 포트라 작년에 마사와 녹소토를 많이 섞은 흙으로 분갈이 해 두었습니다.\r\n\r\n작약은 마당에 심어두면 별다른 관리가 없어도 벌브가 잘 굵어지고 꽃대도 잘 올려주는데, 화분에서는 흙심을 받지못해 겹장수가 많은 큰꽃을 피우기가 어렵습니다. 화분에서는 흙심을 대신할 수 있도록 충분한 영양제를 올려주면 꽃을 이쁙 피워줍니다.',20,'2025-05-21 16:48:40'),(2,'깽깽이풀','깽깽이풀.jpg',12000,'성장이 빠른것도 아니고 키우기 쉬운것도 아닌데, \r\n\r\n매년 일찍 품절되는 이유는 키워본 사람만이 아는 매력입니다. \r\n\r\n작고 앙증맞은 보라색 꽃은 물론 잎 조차도 우아한 \r\n\r\n토종야생화에 퐁당 빠져봅시다!',500,'2025-05-21 17:11:12'),(3,'때죽나무','때죽나무201.jpg',170000,'토종 때죽나무 입니다.\r\n첫 곡이 하부에 형성된 전형적인 명품 수형입니다\r\n꽃이 아름답고 열매가 주렁주렁 열리면 환상적입니다\r\n목대가 두껍기만 하다고 좋은 수목이 아닙니다\r\n곡과 가지배열 등 기본과 미적 특성이 좋아야 명품입니다\r\n가지마다 꽃눈이 많이 맺혔습니다(국내분)',6,'2025-05-21 17:12:02'),(4,'레드벨벳','레드벨벳.jpg',7500,'붉은 벨벳으로 빚어놓은듯 우아하고 매혹적인 벨벳느낌의 꽃송이가 \r\n환상적인 레드벨벳 찔레랍니다\r\n강렬하고 매혹적인 벨벳느낌의 붉은빛 꽃을피워 화려하고 아름다운\r\n자태를 연출해 짜릿한 힐링을 선사해 주는 레드벨벳입니다~!\r\n햇살과 바람을 사랑하는 아리따운 벨벳찔레의 화려하고 강렬한매력을\r\n한껏 누려보세요~~~^0^.\r\n통풍이 잘되고 햇빛이 좋은 곳에서 키워주시고 물은 화분의 겉흙이\r\n마르면 흠뻑주세요~.\r\n베란다 및 노지월동 가능합니다',150,'2025-05-21 17:12:59'),(5,'로치','로치(80).jpg',8000,'줄기가 길게 뻗어나오며 방사형으로 줄기가 뻗어나오는 멋진 수형을 만들 수 있습니다\r\n가장 예쁘게 키울 수 있는 계절은 가을,겨울 이에요 \r\n병충해에 강하지만 더운 여름은 살짝 힘들어하기 때문에 이때만 반음지에 놓고 키워주세요 ',50,'2025-05-21 17:13:41'),(6,'로로코제라늄','로코코제라늄.png',10000,'꽃이 예쁜  제라늄 .로코코 입니다.\r\n과습에 주의 하시고 분갈이는 환경적응후 2주 이상 지난뒤가 좋습니다.\r\n반품.환불.교환 불가하니 신중한 구매 바랍니다.\r\n단품으로 동일품 발송입니다.',30,'2025-05-21 17:14:23'),(7,'론에반스','론에반스.jpg',3000,'멕시코 원산의 에케베리아속 다육식물 론에반스 입니다.\r\n색감이 아주 아름다워 관상가치가 높습니다\r\n귀여운 통통한 잎의 끝이 붉은 색상으로 물들어 있어 멋집니다.',100,'2025-05-21 17:14:49'),(8,'목향장미','목향장미.jpg',28000,'아름다운 향기와 장미를 닮은 우아한 자태의 겹꽃이 매력만점\r\n목향장미는 우아하고 화사한 자태의 겹꽃을 피우며 줄기와 가지에\r\n가시가 없는 것이 특징이며 관리가 편해 인기가 많은 품종입니다\r\n정원이나 울타리에 심어 키우셔도 멋진 장관을 연출할 수 있습니다.\r\n햇빛 좋은 곳에 두고 키워주시고 물은 화분의 겉 흙이 마르면 흠뻑주세요\r\n베란다월동 및 노지월동 가능합니다',32,'2025-05-21 17:15:30'),(9,'몬스테라 델리시오사','몬스테라.jpg',99000,'몬스테라의 대표적인 품종 중 하나로, 잎이 크고 구멍이 난 독특한 모양이 특징입니다. \r\n플랜테리어로 인기가 많으며, 잎에 있는 찢어진 구멍과 큰 잎 크기가 특징입니다. \r\n몬스테라 델리시오사는 공기 정화 능력도 뛰어나 가정이나 사무실에서 인테리어 효과를 높이는 동시에 공기 정화 효과를 누릴 수 있습니다. ',20,'2025-05-21 17:16:10'),(10,'무늬백일홍','무늬백일홍.jpg',20000,'부처꽃과의 배롱나무속으로 중국원산의 관상용식물로 우리나라에 들어왔으며\r\n줄기는 곧게 자라고 껍질은 갈색을 띠고 털은 없습니다.\r\n7~9월에 가지끝에서 고깔꽃차례로 여러개의 꽃이 모여 핍니다.\r\n꽃은 두성꽃이며 오랫동안 피고 지므로 100일동안 꽃이 핀다하여 백일홍이라 부릅니다.\r\n열매는 튀는 열매로 거의 둥글며 9~10월에 익고 6조각으로 갈라지며 밑에는 꽃받침이 남아 붙어 있습니다.\r\n오랫동안 자라면 저절로 목질부의 껍질이 벗겨져 얼룩무늬의 아름다운 수피가 이뤄집니다.',28,'2025-05-21 17:16:51'),(11,'무늬히메몬스테라','무늬히메몬스테라.jpeg',120000,'무늬가 나온 잎이 화이트에 녹색이 산반으로 점점이 박혀 있거나 펼쳐져 있어서 수채화 느낌이 나는 잎이 \r\n올망졸망 귀여운 히메 몬스트라 입니다. ',5,'2025-05-21 17:17:25'),(12,'미라빌리스','미라빌리스.jpg',75000,'붉은색을 띄는 아름다운 잎을 가졌어요.\r\n배수좋게 심으셔서 일주일에 한번정도 물을 챙겨주세요 \r\n습도만 유지해 주어도 싹이 나올정도로 키우기 쉬운 식물이에요.\r\n1/3정도 흙에 심기도록 심어주세요',15,'2025-05-21 17:18:06'),(13,'배롱나무 ','배롱나무.jpg',13000,'백일홍을 줄여서 부른 것이 배롱나무라는 이름이 되었어요 \r\n묘목은 햇볕이 잘 드는 장소에 심어 주고 꽃이 모두 시들고 가을~겨울이 되면 가지치기를 해주세요 \r\n배수가 잘 되는 흙에서 잘 자라 미사토를 섞기도 하며 봄에 심는 것이 좋아요 \r\n7월부터 9월까지 꽃이 핍니다',100,'2025-05-21 17:21:37'),(14,'백정화','백정화.jpg',9000,'복륜으로 테두리만 들어간 일반적인 백정화가 아닙니다.\r\n이 상품은 복륜과 중투 무늬가 함께 들어가 있으며\r\n흰색 무늬가 유령잎 처럼 강하게 발색되는 상품 입니다.\r\n정원수나 정원 울타리로 식재하시면 화려하여 아름답습니다.\r\n무늬가 강하여 유령잎 처럼 보이는 잎들도 강한 햇볕에 타거나 시들지 않습니다.\r\n햇볕이 강할수록 세력이 왕성할수록 무늬 발색이 화려하게 발색됩니다.\r\n등록일 기준 현재 모두 꽃이 피어 있습니다.',3,'2025-05-21 17:22:09'),(15,'분홍때죽나무','분홍때죽나무.jpg',200000,'멋진 수형으로 튼실하게 잘 키운\r\n\r\n분홍때죽나무입니다.\r\n\r\n2025년 5월 9일 모습입니다.\r\n\r\n동일품배송합니다.',5,'2025-05-21 17:22:41'),(16,'블랙티나','blacktina.jpg',2000,'\"다육이의 잎 상태와 사이즈\" 등을\r\n\r\n꼭 확인 부탁드립니다!\r\n\r\n(식물특성상 보관 중 문제가 발생될 경우\r\n\r\n비슷한 종자로 교체하여 보내드릴 수도 있으며...\r\n\r\n진행전 고객님께 연락 드린 후 진행하고 있는 점\r\n\r\n참고 부탁드립니다.)',16,'2025-05-21 17:23:46'),(17,'블루 드래곤','블루드래곤.jpg',1500,'다육식물\r\n물 주면 통통해지고 칼슘제 주면 더 통통해집니다\r\n봄, 가을에 물을 주면 성장에 더 도움이 됩니다\r\n\r\n화분 사이즈\r\n지름 : 7.5cm\r\n높이 : 7.5cm',26,'2025-05-21 17:24:14'),(18,'노티카','사계장미노티카.jpg',34500,'독일 유럽 사계 장미 노티카 [보라색 특성상 수량 많지 않음]\r\n\r\n100% 사계장미입니다\r\n\r\n당연 올해꽃달립니다\r\n\r\n보라색꽃이 바글바글피고\r\n\r\n향이좋은 신품종입니다',10,'2025-05-21 17:25:21'),(19,'큰상추','상추.jpg',11500,'신선한 적아삭이상추 모종입니다:)\r\n기존모종 보다 큰 사이즈라서 빨리 드실 수 있습니다 !!\r\n5개씩 1세트로 판매합니다 ! ',62,'2025-05-21 17:25:45'),(20,'스피아민트 ','스피아민트.jpg',2900,'너무 귀여운 향기나는 식물 스피아민트 입니다 :)\r\n스피아민트는 페퍼민트와 비슷한 향과 맛을 가지고 있어요\r\n또한 소화불량 개선 효과와 구취제거 효과가 있는 식물 입니다 !\r\n스피아민트는 겉흙이 마르면 물을 흠뻑 주시면 좋습니다 !!\r\n다만 여름 장마철에는 과습 주의 해주세요 !!',92,'2025-05-21 17:26:31'),(21,'샤인브라이트','샤인브라이트.jpg',4000,'대부분의 경우 식물만 포장합니다.\r\n우리 상점의 경우 거의 모든 상품은 합식이거나 적심군생입니다.\r\n가격이나 사이즈를 참고해주시면 자연군생이기 어렵습니다.^^',25,'2025-05-21 17:39:23'),(22,'아미스타','아미스타.jpg',4000,'다육 식물 아미스타(Ami-star)는 군생으로 키울 때 더욱 아름다운 모습을 보여주는 인기 있는 다육 식물입니다. \r\n잎이 겹겹이 쌓여 있어 마치 꽃처럼 보이기도 하고, 시간이 지날수록 색이 변하는 특징을 가지고 있습니다',12,'2025-05-21 17:39:54'),(23,'알라만다-황금트럼펫','알라만다.jpg',14900,'황금 트럼펫 꽃은 알라만다(Allamanda)의 한 품종으로, 노란색으로 피는 꽃을 가진 덩굴 식물입니다. \r\n알라만다는 노란색과 짙은 노란색의 아름다운 꽃을 피우며, 마치 트럼펫처럼 굽이치는 모양의 꽃잎이 특징입니다.\r\n알라만다를 키울 때에는 햇빛이 잘 드는 곳에 두어야 하며, 물은 흙이 마르지 않도록 적당량 주어야 합니다. \r\n또한, 덩굴이 잘 자라도록 지지대를 설치해 주는 것이 좋습니다. ',28,'2025-05-21 17:41:15'),(24,'애니시다','애니시다.jpg',6500,'싱그러운 봄을 표현하는\r\n레몬색 꽃을 가진 \"애니시다\"\r\n꽃에서는 상큼한 향기가 나며\r\n노랑꽃으로 인테리어용으로도 아주 예쁩니다.\r\nდ개화시기: 4-5월დ\r\n햇빛과 통풍이 잘 되는 곳에서 키워주시고\r\n물을 좋아하니 자주 주시면 됩니다.\r\n(배송시기에 따라 꽃의 유무가 다를 수 있습니다.)',51,'2025-05-21 17:41:49'),(25,'옐로우 옌젤 ','옐로우엔젤.jpg',3900,'노란색 이쁜 꽃이 피는 지피식물입니다 \r\n낮게 퍼지면서 노란색 꽃 과함께 \r\n늘어지는 아이들인데 참 매력적이랍니다',111,'2025-05-21 17:42:20'),(26,'올리브나무','올리브나무.jpg',24900,'멋스러운 외목수형과 탐스러운 올리브 열매가 열리는 \r\n올리브나무를 집에서 키워보세요\r\n유럽풍의 멋스러움을 물씬 풍기는 아름다운 올리브나무를\r\n이제 우리집에서도 키워보세요\r\n햇빛좋고 통풍이 좋은곳에서 관리해 주시면 특별히 신경쓰지\r\n않아도 무척 잘 자란답니다~!\r\n\r\n평소 물관리는 화분의 겉흙이 마르면 물을 흠뻑 주세요.',12,'2025-05-21 17:42:52'),(28,'제이드 자스민','제이드자스민9.jpg',25000,'\'신의 선물\' 이라고도 불리는 꽃입니다.\r\n향기가 짙고 은은합니다.\r\n방 한가득 자스민의 향이 퍼져 \r\n천연 방향제가 따로 없습니다.',6,'2025-05-21 17:44:09'),(29,'카라 레드심포니','카라 레드심포니 구근.jpg',10000,'노지 식재시 구근의 2배 깊이로 배수가 잘되고 반그늘진 장소에 심으면 착색이 좋다.\r\n화분 식재시 새순이 나올때 웃거름으로 지효성 비료를 올려 주면 튼튼한 꽃대를 볼 수 있다.\r\n여름철 고온 다습때 뿌리가 썩을수 있으니 통풍이 잘되는 반그늘에서 보관한다.\r\n물을 싫어 하므로 겉흙이 충분히 마르면(10일에 1번정도)준다.',100,'2025-05-21 17:44:37'),(30,'테이블야자','테이블야자.jpg',10000,'테이블야자 +아트스톤팟+받침\r\n싱그럽고 시원하게 뻗은 잎이 매력적인 이 식물은, 실내에서 키우기에 딱 좋은 반려식물이에요.\r\n공기 정화 능력이 뛰어나 벤젠, 폼알데히드 같은 유해 화학물질을 제거하고,\r\n미세먼지까지 줄여주는 효과가 있어 건강한 실내 환경을 만들어줍니다. \r\n게다가 습도나 햇빛에 민감하지 않아 식물을 처음 키워보는 분들도 쉽게 기를 수 있습니다.\r\n크게 손이 가지 않으면서도 공간에 싱그러움을 더해주는 이 식물,\r\n이번 기회에 나만의 반려식물로 맞이해보는 건 어떨까요?',5,'2025-05-21 17:45:10'),(31,'호접란','호접란.jpg',39900,'호접란 블루계열\r\n신비하고 영롱한 색감을 내뿜는 꽃의 아름다움\r\n이전과는 완전히 색다른\r\n아름다움을 자아냅니다.\r\n\r\n​동양난에 비해 화사한 특징을 갖고있는 서양난 계열로\r\n단단한 줄기에 몽글몽글 열려있는 꽃잎이\r\n집안 전체에 화사함을 가져다 줍니다\r\n특유의 화려한 색은 마음에 생동감을 선사합니다.',5,'2025-05-21 17:45:33'),(32,'흰색제라늄 ','흰색제라늄.jpg',12000,'키우기 까다롭지만 겹겹히 쌓인 꽃잎이 마치 장미처럼 우아하고 귀엽습니다.',32,'2025-05-21 17:46:05');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_comment`
--

DROP TABLE IF EXISTS `store_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_comment` (
  `scom_idx` int NOT NULL AUTO_INCREMENT,
  `scom_contents` varchar(200) NOT NULL,
  `p_idx` int DEFAULT NULL,
  `user_num` int DEFAULT NULL,
  PRIMARY KEY (`scom_idx`),
  KEY `p_idx` (`p_idx`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `store_comment_ibfk_1` FOREIGN KEY (`p_idx`) REFERENCES `store` (`p_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `store_comment_ibfk_2` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_comment`
--

LOCK TABLES `store_comment` WRITE;
/*!40000 ALTER TABLE `store_comment` DISABLE KEYS */;
INSERT INTO `store_comment` VALUES (1,'잘 받았습니다. 수형이 생각했던거랑 느낌이 달라서 살짝 당황했지만 목대가 짱짱하고 튼실해서 아주 만족합니다. 빨리 예쁜 꽃 보고싶어요.',1,2),(2,'너무도 어린아이들이 와서 올해 튼튼히 키워 내년에 꽃피우면 사진 올릴께요 야생화 사랑합니다~',2,2),(3,'2번째 주문역시 건강해보입니다 감사합니다',25,3),(4,'상태 괜찮게 도착했고 뿌리 활착도 잘 돼요. 생각보다 빨리 꽃 피워서 만족합니다',4,3),(5,'어떻게 키워야 하는 건지 몰라 산야초와 녹소토 상토를 섞어 심어 놨어요 처음 보지만 잘 키워 볼게요. 감사드립니다.',3,4),(6,'키가 조금 큰 편이라 베란다에 두니 공간 차지 좀 있지만, 전반적으로 만족합니다.',15,4),(7,'풍성하고 짱짱한 블루드래곤으로 보내 주셔서 너무 감사드립니다.',17,5),(8,'배송 때 흔들림 없게 잘 왔고 흙도 잘 정리돼 있었어요.',21,5),(9,'감사합니다 잘키워 볼게요',16,5),(10,'크기가 생각보다 작긴 했지만 상태는 아주 양호했습니다.\r\n흙이 마르지 않게 잘 포장돼 있었고 잎도 쭈글거림 없이 왔어요.\r\n물 주기 부담 없고 책상 위에 두기 딱 좋네요.',22,6),(11,'박스 열자마자 흙도 흐트러지지 않고 깔끔하게 도착했어요.\r\n잎이 탱글탱글하고 색감도 잘 살아 있어서 만족스럽습니다.\r\n배송 중 손상 없이 와서 좋았습니다!',7,6),(12,'향이 너무 좋아서 마음이 편안~ 아이와 함께 물 주는 재미도 있네요 \r\n창가에 두니 인테리어 효과도 굿',20,7),(13,'꼼꼼한포장이랑 이쁜 식물 감사합니다\r\n너무 만족합니다',9,7),(14,'튼튼한 아이가 왔어요 잎장도 크고 넘 예쁘네요\r\n감사드립니다 또 방문하겠습니다',11,10),(15,'박스 열었을 때 꽃이 조금 떨어졌지만 전반적으로 상태 양호했습니다. 줄기가 생각보다 얇네요... ',24,10),(16,'생각보다 크고 꽃 색이 진해서 눈에 띄네요. 배송 중에 꽃 하나 떨어졌지만 나머지는 괜찮았어요.',23,10),(17,'꽃잎 상태도 깔끔했고 실내에 바로 배치해도 될 만큼 깨끗했어요.',31,8),(18,'올리브나무 몇그루 갖고있는데도 너무 잘생겨서 또 들였네요ㅎ\r\n너무너무 이쁜 올리브나무를 산것같아 감사드리구요~',26,8),(19,'건강하고 꽃대도 많이 올리고 있어요.',28,8),(20,'수형도 좋고 튼튼해 보입니다',10,9),(21,'배송 빠르고\r\n건강하고 예쁜애로 보내주셨어요!\r\n잎이 너무 진하고\r\n반짝여서 놀랐어요!\r\n잎 뒤도 깨끗하고♡\r\n너무나 감사드립니다\r\n번창하시길~!',13,9),(22,'박스 열어보니 괴근 상태가 꽤 단단하고 건조 손상 없이 잘 도착했어요.',12,9),(23,'잎이 떨어지지 않고 포장도 섬세하게 신경써주셨네요 감사합니다',12,11),(24,'사장님~ 보내 주신 제라늄 잘 받았습니다. 수형 만드는 재미가 있을 것 같아요. 또 사러 오겠습니다. 매번 감사합니다!',6,2),(25,'안전하고 빠른 배송 감사합니다. 건강한 모종들로 보내주셨네요^^',19,2),(26,'사진그대로 예쁜아이가왔어요\r\n꽃색이 참~예쁘네요 포장도 꼼꼼하게 잘왔구요\r\n예쁜화분에 옮겨심어야겠어요 잘키울께요',8,4),(27,'가격이 좀 비싼가 했는데 실제 받아보니 사진보다 실물이 훨씬 크고 튼튼해요\r\n화분 지름 45cm에 심은거에요 정말 크고 멋져요\r\n꽃대 정말 많이 올라와있어요\r\n넘 만족스러워요\r\n꽃이 언능 피면 좋겠어요 :)',8,5),(28,'구근이 원래 작나요 첨 키우는 구근이라... 잘 키워볼게요',29,5),(29,'너무 어린 묘목 이네요.\r\n꽃 보려면 오래 걸릴 것 같아요.\r\n귀한 것 잘 키워 볼게요.',4,6),(30,'잘 도착했습니다! 배송중에 어떤 일이 있어도\r\n끄덕 없겠습니다.. 포장.. 감동이고 최고 수준이요.\r\n무엇보다 받은 아이들 모두 좋습니다.\r\n실물들 그대로 다 이쁘고 튼실튼실하기까지요. 감사합니다. 잘 키우겠습니다!',32,6);
/*!40000 ALTER TABLE `store_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_num` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `user_passwd` varchar(100) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_nickname` varchar(30) NOT NULL,
  `roadAddrPart1` varchar(50) NOT NULL,
  `addrDetail` varchar(50) NOT NULL,
  `zipNo` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_tel` varchar(13) NOT NULL,
  `user_authority` varchar(5) DEFAULT 'user',
  PRIMARY KEY (`user_num`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `user_nickname` (`user_nickname`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$KIvnjHwbeQAWfJz9lwj8C.xgoDTacJQtKRu.Ew595pn1HBbwRxNoG','관리자','관리자','','','','admin@plantopia.com','010-0000-0000','admin'),(2,'logintest1','$2a$10$BGPDlHvzI3h71M8wjIoD1ON8vg2Dfpzkf/K3uynV1WRGa0kwjLS5S','이순신','sunsin','서울특별시 강남구 강남대로 408','삼성 그린코아 101동 1201호','06134','sunsin@naver.com','010-2094-6675','user'),(3,'logintest2','$2a$10$mFtW4n1Ic771Zht7wjG2DOScVyd04ZDrW887lbTz8OOfawyyMemfi','장보고','jangbogo','충청남도 청양군 화성면 무한로 115','성심아파트 301동 2401호','33310','badada@nate.com','010-4895-6624','user'),(4,'logintest3','$2a$10$8hWHPU6mpJm7waGXSHLUgOOMwSgfNIYmQTMbSapRL/M7y2/0avZC2','김유신','yusinkim','강원특별자치도 철원군 동송읍 금학로 220-1','용우아파트 40-1라인 1021호','24015','yusinla@daum.net','010-3501-2998','user'),(5,'logintest4','$2a$10$vq7U69Hs.KAlJVRGe77BcuvPnjQ4/QJEsJDUR.yVtnNUmNC1V32yW','홍길동','mrhong','서울특별시 광진구 구천면로 14','진구아파트 202동 2001호','04970','hong@hanmail.net','010-5511-2280','user'),(6,'logintest5','$2a$10$qWDOxzWa6Mu4wTW1nwQkzuDhTZOISWhcrw82T3xPQEvOliO0jMPp.','강감찬','balhae','서울특별시 강남구 삼성로 212','101동 1203호','06284','gamchan@naver.com','010-9872-3256','user'),(7,'logintest6','$2a$10$I9Fs4ss0ZAUPFRvIX1GVZuuVxauXSSRbAdgetjEKKGRsl.fyWUI6a','유재석','metuki','부산광역시 해운대구 센텀동로 6','센텀파크아파트 103동 1502호','48059','jasuk@daum.net','010-7621-3401','user'),(8,'logintest8','$2a$10$iqNDYPXbCTAki7dJrABbIeEbw1l7r4re66K0q80.A6h23Q5XMRjVm','박명수','mungsuu','인천광역시 연수구 송도과학로51번길 16','201동 1701호 (송도동, 송도더샵퍼스트월드)','21983','muhan@nate.com','010-6681-1748','user'),(9,'logintest9','$2a$10$NbFbZTl56MgWTiKPQ9nkXOkOIIMO6TwO9k0OMIQmmSj4CpdR0m0tG','정준하','junha','경기도 성남시 분당구 수내로 201','302동 1002호','13581','junha12@hanmail.net','010-4922-4391','user'),(10,'logintest7','$2a$10$KG7Y6EZjWrzNYMywd7dEx.OhClbEXBTzYK.mET2xYTtJzVeT.vk8G','전진','dash','부산광역시 남구 이기대공원로 105','32번지','48576','junjin@naver.com','010-7164-1876','user'),(11,'logintest10','$2a$10$flQKqiBsBRmRrSn6LF8l5ubAyRnNFZ6Yd5r/0vWSafELUQiup5HNe','노홍철','luckyguy','서울특별시 동작구 흑석한강로 12','501동 2001호','06981','hongchul@nate.com','010-1470-0641','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-22 14:06:44
