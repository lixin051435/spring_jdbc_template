/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : bn10

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2020-05-24 15:38:02
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(1000) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO t_admin VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for `t_bk`
-- ----------------------------
DROP TABLE IF EXISTS `t_bk`;
CREATE TABLE `t_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bkName` varchar(100) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Records of t_bk
-- ----------------------------
INSERT INTO t_bk VALUES ('3', '洗护');
INSERT INTO t_bk VALUES ('4', '化妆水');
INSERT INTO t_bk VALUES ('5', '精华');
INSERT INTO t_bk VALUES ('6', '卸妆');
INSERT INTO t_bk VALUES ('7', '眼霜');
INSERT INTO t_bk VALUES ('8', '面膜');
INSERT INTO t_bk VALUES ('9', '防晒');
INSERT INTO t_bk VALUES ('10', '彩妆');

-- ----------------------------
-- Table structure for `t_cp`
-- ----------------------------
DROP TABLE IF EXISTS `t_cp`;
CREATE TABLE `t_cp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `content` text COMMENT '产品说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Records of t_cp
-- ----------------------------
INSERT INTO t_cp VALUES ('4', '迪奥口红999', 'upload/20200408/158631950963220.png', '无论是经典缎光,优雅哑光,前卫金属光,烈艳蓝金999始终是迪奥传奇红唇的经典诠释.烈艳蓝金,红唇誓爱.\r\n独特的液态丝绒哑光唇釉,兼具光泽与雾面效果,尽享唇间丝绒华服.诞于高定后台,灵感源自高级天鹅绒面料,大胆突破传统质感与妆效的束缚,改写唇妆历史.\r\n\r\n');
INSERT INTO t_cp VALUES ('5', '雅诗兰黛小棕瓶精华', 'upload/20200408/158631960220025.PNG', '雅诗兰黛小棕瓶一瓶精华凝萃，开启全能全效的护眼体验！饱含点滴ANR修护精华，强效能量深透眼周肌肤，根源改善细纹、皱纹、浮肿、黑眼圈、干燥及肤色不均6大问题，抵御各类岁月侵袭，24小时全天呵护与修护年轻明眸。全新即时修护特润眼部精华包含首次在特润修护系列中使用的独创同步修复技术，帮助支持肌肤细胞在精准时间自我修复的天然同步机制。因此，眼周的细纹和皱纹随时间逐渐减淡。\r\n');
INSERT INTO t_cp VALUES ('6', '兰蔻粉水可收缩毛孔', 'upload/20200408/158631965199457.PNG', '兰蔻粉水有着一个很神奇的功效，那就是它的收缩毛孔的功能。大家联系使用四个星期I后，就可以发现原来毛孔粗大的现象得到改善，即便是素颜也能使毛孔隐形，从而打造零毛孔的完美肌肤。这是因为兰蔻粉水可以调节皮肤的水油平衡，而毛孔粗大主要是因为皮肤的水油失衡所引起的，所以兰蔻粉水的特性正好可以对毛孔粗大对症下药，这样就能有效收缩脸上毛孔了。\r\n');
INSERT INTO t_cp VALUES ('7', '阿道夫洗发水', 'upload/20200408/15863197248998.PNG', '洗发水是指一种具有去头屑功能、 焗油功能和染发等功能的护发产品。洗发水中含有多种成分，这些成份的综合作用能起到清洁头皮和头发的功能。通常洗发露中最能起作用的成份是表面活性剂，表面活性剂起着清洁头发和头皮的作用，当洗发液与水混在一起时能产生泡沫，不过泡沫的多少并不能反映出清洁能力的强弱。\r\n');
INSERT INTO t_cp VALUES ('8', '香奈儿山茶花洗面奶', 'upload/20200408/158632007389940.PNG', '香奈儿奢华精萃活肤系列产品，升华洁面艺术：带来精致、纯粹的愉悦享受，塑造美丽动人的肌肤。主要配方为珍贵山茶花与荷荷巴油，为肌肤带来舒缓享受，舒适感无与伦比。 ');
INSERT INTO t_cp VALUES ('9', '贝德玛卸妆水', 'upload/20200408/158632118797537.PNG', '贝德玛卸妆水由法国崭新科技 MICELLE 配方组成 , 内含水溶及油溶份子来可全面洗净肌肤毛孔内外污垢，再加上青瓜植物精华，用後绝不绷紧。成份简单，不含香料，敏感肌肤亦可使用．专利 MICELLE 洁肤配方「 BIODERMA 洁肤水」的 Micelle 溶妆粒子，特有水溶及油溶份子，可溶解面上及毛孔内的的污垢。\r\n');
INSERT INTO t_cp VALUES ('10', 'cpb隔离 黑管', 'upload/20200408/158632127303620.PNG', '这点只能针对个人的使用感来说!每个人使用下来一定会有个体差异，这部分感受还是和质地有关，白管吸收快，使用前一定要注意用好补水，否则可能会起皮;黑管相对润泽一点(注意是滋润版)，更要注意好控油。两者可以分区使用(如双颊使用黑管，T区白管)，但是两者在这方面差别并不很大，反而使用时要注意的是用量不能太多造成假白。\r\n');
INSERT INTO t_cp VALUES ('11', '纪梵希散粉', 'upload/20200408/158632132727513.PNG', '纪梵希散粉色号共有6种，提供给不同肤色特点的女士选用，分别为：1色号为轻柔淡彩、2色号为精制米色、3色号为甜蜜焦糖、4色号为温柔阳光、5色号为柔和白色、6色号为清新玫瑰。');

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(1000) DEFAULT NULL COMMENT '账号',
  `password` varchar(1000) DEFAULT NULL COMMENT '密码',
  `name` varchar(1000) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(1000) DEFAULT NULL COMMENT '手机',
  `sex` varchar(100) DEFAULT NULL COMMENT '性别',
  `age` varchar(100) DEFAULT NULL COMMENT '年龄',
  `address` varchar(100) DEFAULT NULL COMMENT '家庭住址',
  `idcard` varchar(100) DEFAULT NULL COMMENT '身份证',
  `insertDate` datetime DEFAULT NULL COMMENT '入库日期',
  `headPic` varchar(50) DEFAULT NULL COMMENT '头像',
  `level` varchar(50) DEFAULT NULL COMMENT '层级',
  `isft` varchar(50) DEFAULT NULL COMMENT '发帖权限',
  `ispl` varchar(50) DEFAULT NULL COMMENT '评论权限',
  `mb1` varchar(50) DEFAULT NULL COMMENT '密保1',
  `mb2` varchar(50) DEFAULT NULL COMMENT '密保2',
  `mb3` varchar(50) DEFAULT NULL COMMENT '密保3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO t_customer VALUES ('11', 'qq', '123', '里一个', null, '男', null, null, null, '2019-12-02 20:43:52', 'upload/20200223/158245102067324.png', '初级', '是', '是', '', '', '');
INSERT INTO t_customer VALUES ('12', 'lll', '11', 'liyige', null, '男', null, null, null, '2019-12-25 22:30:55', '', '初级', '是', '是', '', '', '');
INSERT INTO t_customer VALUES ('14', '123', '123', '丽丽', null, '男', null, null, null, '2020-02-23 21:16:21', 'upload/20200223/15824637742246.png', '初级', '是', '是', '', '', '');
INSERT INTO t_customer VALUES ('15', '1234', '1234', '李莉莉', '11', '女', '1', '11', '1', '2020-02-23 23:44:28', 'upload/20200223/158247265905332.png', '初级', '是', '是', '1', '2', '3');
INSERT INTO t_customer VALUES ('16', '666', '12345', 'lili', '', '男', '', '', '', '2020-02-24 00:13:06', 'upload/20200224/15824746284503.JPEG', '初级', '是', '否', '1', '2', '3');
INSERT INTO t_customer VALUES ('17', '716', '123', '里一个', '123456', '女', '19', '', '', '2020-03-18 18:22:28', 'upload/20200318/158452693958555.png', '初级', '是', '是', '1', '2', '3');
INSERT INTO t_customer VALUES ('19', '123', '123', '里一个', '15504260628', '男', '22', '沈阳市辽中', '21102118870426', '2020-03-18 21:59:49', null, null, '是', '是', null, null, null);
INSERT INTO t_customer VALUES ('21', 'ad', '11', '', null, '男', null, null, null, '2020-03-18 22:44:40', 'upload/20200318/158454266385083.png', '初级', '是', '是', '', '', '');
INSERT INTO t_customer VALUES ('22', '11', '11', '1', '11', '女', '11', '11', '11', '2020-03-18 22:54:59', 'upload/20200318/158454329319813.png', '初级', '是', '是', '1', '2', '3');
INSERT INTO t_customer VALUES ('23', 'qq', '', '', '', '男', '', '', '', '2020-03-18 22:58:17', null, null, '是', '是', null, null, null);
INSERT INTO t_customer VALUES ('24', '1', '2', '1', '', '男', '', '', '', '2020-03-19 22:09:13', '', '初级', '是', '是', '', '', '');
INSERT INTO t_customer VALUES ('25', 'min', '11', '', '', '男', '18', '', '', '2020-03-20 13:31:20', '', '初级', '是', '是', '', '', '');
INSERT INTO t_customer VALUES ('26', 'zzz', '123', '', '', '男', '', '', '', '2020-03-30 19:31:37', '', '初级', '是', '是', '', '', '');
INSERT INTO t_customer VALUES ('28', '19970426', '123', '里', '15504260628', '女', '19', 'llll', '', '2020-04-07 16:37:53', 'upload/20200407/158624045636322.png', '初级', '是', '是', '0', '0', '0');
INSERT INTO t_customer VALUES ('29', '3', '1', '', '', '男', '', '', '', '2020-04-10 11:17:48', '', '初级', '是', '是', '', '', '');
INSERT INTO t_customer VALUES ('30', '11111', '11', '里一个', '11', '男', '19', '11', '11', '2020-05-24 10:30:46', 'upload/20200524/159028741783274.PNG', '初级', '是', '是', '1', '1', '1');
INSERT INTO t_customer VALUES ('31', '111111', '11', '1', '15504260628', '男', '19', '11', '11', '2020-05-24 10:44:07', 'upload/20200524/159028823172945.PNG', '初级', '是', '是', '1', '1', '1');

-- ----------------------------
-- Table structure for `t_dz`
-- ----------------------------
DROP TABLE IF EXISTS `t_dz`;
CREATE TABLE `t_dz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL COMMENT '用户',
  `wdxxId` int(11) DEFAULT NULL COMMENT '信息',
  `insertDate` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='点赞';

-- ----------------------------
-- Records of t_dz
-- ----------------------------
INSERT INTO t_dz VALUES ('1', '11', '13', '2019-12-02 20:44:56');
INSERT INTO t_dz VALUES ('2', '13', '10', '2020-02-23 01:13:29');
INSERT INTO t_dz VALUES ('3', '13', '8', '2020-02-23 01:14:24');
INSERT INTO t_dz VALUES ('4', '13', '12', '2020-02-23 16:39:53');
INSERT INTO t_dz VALUES ('10', '11', '12', '2020-02-23 18:29:36');
INSERT INTO t_dz VALUES ('11', '11', '14', '2020-02-23 18:31:16');
INSERT INTO t_dz VALUES ('12', '13', '14', '2020-02-23 20:12:37');
INSERT INTO t_dz VALUES ('13', '14', '15', '2020-02-23 21:23:26');
INSERT INTO t_dz VALUES ('14', '15', '16', '2020-02-23 23:51:57');
INSERT INTO t_dz VALUES ('17', '14', '12', '2020-03-19 21:56:58');
INSERT INTO t_dz VALUES ('18', '31', '34', '2020-05-24 10:48:11');
INSERT INTO t_dz VALUES ('19', '31', '32', '2020-05-24 10:50:31');

-- ----------------------------
-- Table structure for `t_fzjc`
-- ----------------------------
DROP TABLE IF EXISTS `t_fzjc`;
CREATE TABLE `t_fzjc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='肤质检测';

-- ----------------------------
-- Records of t_fzjc
-- ----------------------------
INSERT INTO t_fzjc VALUES ('8', '<div class=\"text-title\" style=\"border: 0px; margin: 0px; padding: 0px; font-size: 12px; position: relative; top: -6px; color: rgb(102, 102, 102);\">\r\n<h1><strong>你真的知道自己是什么肤质吗？花3分钟来个科学测试吧！</strong></h1>\r\n\r\n<div class=\"article-info\" style=\"border: 0px; margin: 0px; padding: 15px 0px 0px; font-size: 14px; line-height: 20px; color: rgb(153, 153, 153);\">2017-06-10 20:35<a href=\"http://www.sohu.com/tag/63678\" style=\"color: rgb(83, 159, 243); background-color: transparent; border: 0px; margin: 0px; padding: 0px; text-decoration-line: none; float: left;\" target=\"_blank\">护肤</a></div>\r\n</div>\r\n\r\n<p>鲸鲸有一次和闺蜜聊天</p>\r\n\r\n<p>说起为什么大家使用同一款产品</p>\r\n\r\n<p>有人给满分有人却甩差评</p>\r\n\r\n<p>发现是他们的肤质不一样</p>\r\n\r\n<p>使用的效果也不一样</p>\r\n\r\n<p>鲸鲸最也常在后台看到小仙女们提问</p>\r\n\r\n<p>肤质要如何分辨</p>\r\n\r\n<p>怎样的肤质用怎样护肤品</p>\r\n\r\n<p>今天鲸鲸就邀请了我的<strong>好盆友C姐</strong></p>\r\n\r\n<p>给各位问题小仙女安利三个</p>\r\n\r\n<p><strong>可以分辨自己的肤质的APP</strong></p>\r\n\r\n<p>C姐觉得在冲昏头脑剁手护肤品前</p>\r\n\r\n<p><strong>根据自己肤质剁手的小仙女</strong></p>\r\n\r\n<p><strong>才是Smart Girl</strong></p>\r\n\r\n<p>但有些人号称自己是油皮</p>\r\n\r\n<p>但真相可能是</p>\r\n\r\n<p><strong>TA皮肤很干很缺水所以脸上才出油</strong></p>\r\n\r\n<p>四个字总结：<strong>外油内干</strong></p>\r\n\r\n<p>有些人号称自己是敏感肌</p>\r\n\r\n<p><strong>但真相可能是皮肤缺水、角质层薄</strong></p>\r\n\r\n<p>导致了脸上过敏发红</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/64c96553483540b6a4f51b843e3752c4.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px\" /></p>\r\n\r\n<p>在弄清自己肤质前</p>\r\n\r\n<p>有<strong>两点</strong>需要知道</p>\r\n\r\n<p><strong>肤质是固定不变的吗</strong></p>\r\n\r\n<p><strong>不是！</strong></p>\r\n\r\n<p>会受<strong>年龄、环境</strong>影响</p>\r\n\r\n<p>也受<strong>内分泌、情绪</strong>甚至<strong>体重</strong>影响</p>\r\n\r\n<p><strong>你脸上的肤质都是一样的吗？</strong></p>\r\n\r\n<p><strong>不是！</strong></p>\r\n\r\n<p>全脸划分为<strong>T区</strong>和<strong>U区</strong></p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/f44b68c4adac4108b6feb837f63e2155_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px\" /></p>\r\n\r\n<p><strong>T区皮脂分泌更旺盛</strong></p>\r\n\r\n<p><strong>U区脸颊相对干燥</strong></p>\r\n\r\n<p>其实绝大多数20-26的小仙女</p>\r\n\r\n<p>在夏天是脸颊干，T区油性</p>\r\n\r\n<p>那就是<strong>典型的混合性肌肤</strong></p>\r\n\r\n<p>要细分的话还分</p>\r\n\r\n<p>混合偏油&amp;混合偏干</p>\r\n\r\n<p>其实分辨自己肤质的办法还挺多的</p>\r\n\r\n<p>但因为个体差异太大了</p>\r\n\r\n<p>所以今天C姐</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/1eb10fd0a25a42e687d6671eb7cfe734.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px\" /></p>\r\n\r\n<p>要给你萌介绍<strong>3个App</strong></p>\r\n\r\n<p><strong>科学测试肤质</strong></p>\r\n\r\n<p>（追求非常精准的要去专门的机构测试）</p>\r\n\r\n<p>但C姐也说了</p>\r\n\r\n<p>你的肤质不是一直不变的</p>\r\n\r\n<p>这些<strong>App可以科学测出你的肤质</strong></p>\r\n\r\n<p>方便的同时一定程度上还蛮靠谱</p>\r\n\r\n<p><strong>最重要的是：人家不是广告不是广告啦~</strong></p>\r\n\r\n<p><strong>和所推荐的APP也没有任何利益关系</strong></p>\r\n\r\n<p><strong>美丽修行</strong></p>\r\n\r\n<p>现在会护肤的小仙女越来越Smart了，不只是单纯看商家产品描述的漂亮话，我萌更需要知道这个护肤品的成分，防晒和美白究竟是哪种成分在起作用，反正C姐觉得看成分是挺有意思的一件事～</p>\r\n\r\n<p><strong>成份党必备</strong>的美丽修行App挺专业的，<strong>不做完肌肤测试不给看护肤品推荐，没弄清自己肤质就买买买简直是在耍流氓</strong>，<strong>剁手护肤品这件事跟风就是大忌</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/71ee0ed637e3400293540e706cee98b8_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px\" /></p>\r\n\r\n<p>根据皮肤四大基本要素分型：<strong>油性/干性、敏感/耐受、色素/非色素、皱纹/紧</strong>致等，将皮肤分为2*2*2*2=<strong>16类</strong>。</p>\r\n\r\n<p>科学分析肤质，<strong>肌肤类型的分类比我们想象中要多</strong>，每个测试大约有十几个小问题，费点时间也要好好填写哦～</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/f0448964389f470f8182a98d4644c346_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px\" /></p>\r\n\r\n<p>全部回答之后就会得出你的肤质类型，之后还会给出<strong>护肤指南</strong>和推荐<strong>个人的长草清单</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/54bb341cc31549aba81913b9b5cbe8eb_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px\" /></p>\r\n\r\n<p>根据给我萌推荐的单品，我们还可以<strong>查产品详情</strong>，剁手路上更快乐～更是孕妈护肤必备，查成分一目了然。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/540ce77aa1ea4f8faea1f33b3868df3c_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px\" /></p>\r\n\r\n<p><strong>美肤家</strong></p>\r\n\r\n<p>论产品成分分析和肤质测试，美丽修行比美肤家做得要好。</p>\r\n\r\n<p>但美肤家也有她的特点，比如有<strong>图集和视频专区</strong>，界面非常清新自然，看起来更舒服，其实<strong>和美丽修行搭配使用是最好的</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/f68b14fd579f46cf9467d2f8a8b20898_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px\" /></p>\r\n\r\n<p><strong>社区建设得挺好的</strong>，可以看到不少人拿到<strong>护肤品后的试用报告</strong>，很多都写得挺用心的，各位小仙女要剁手的时候不失为一个很好的参考。</p>\r\n\r\n<p>在社区里还可以提问，有专业的老师可以解答你的问题。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/4c2281c3316e452ca7180258d1aba70f_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; opacity:0.9; padding:0px\" /></p>\r\n');

-- ----------------------------
-- Table structure for `t_huida`
-- ----------------------------
DROP TABLE IF EXISTS `t_huida`;
CREATE TABLE `t_huida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL COMMENT '用户',
  `v1` text COMMENT '问题1',
  `v2` text COMMENT '问题2',
  `v3` text COMMENT '问题3',
  `insertDate` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='问题';

-- ----------------------------
-- Records of t_huida
-- ----------------------------

INSERT INTO t_huida VALUES ('3', '10', 'll', 'll', 'll', '2019-11-29 23:31:00');
INSERT INTO t_huida VALUES ('4', '11', 'aeaeaeaeae', '切切切切、', 'zdzdfzd', '2019-12-02 20:46:19');
INSERT INTO t_huida VALUES ('5', '13', 'lll', 'lll', 'lll', '2020-02-23 16:41:54');
INSERT INTO t_huida VALUES ('6', '15', 'aa', 'qqq', 'pp\r\n', '2020-02-23 23:45:46');
INSERT INTO t_huida VALUES ('7', '14', 'qq', 'qq', 'qq', '2020-03-17 21:11:01');
INSERT INTO t_huida VALUES ('8', '16', '是', '有', '没有', '2020-03-17 21:50:22');
INSERT INTO t_huida VALUES ('9', '16', '拉拉', 'lala', '拉拉', '2020-03-17 21:51:07');
INSERT INTO t_huida VALUES ('10', '15', '1', '1', '1', '2020-03-18 23:27:27');
INSERT INTO t_huida VALUES ('11', '15', '1', '1', '1', '2020-03-18 23:29:50');
INSERT INTO t_huida VALUES ('12', '15', '1', '1', '1', '2020-03-18 23:31:46');
INSERT INTO t_huida VALUES ('13', '15', '', '', '', '2020-03-18 23:32:40');
INSERT INTO t_huida VALUES ('16', '27', '1', '', '', '2020-04-04 21:21:44');
INSERT INTO t_huida VALUES ('17', '11', '1', '1', '1', '2020-04-04 21:51:32');
INSERT INTO t_huida VALUES ('18', '28', '满意', '很有帮助', '无', '2020-04-07 22:00:20');
INSERT INTO t_huida VALUES ('19', '31', '满意 ', '有', '没有', '2020-05-24 10:52:35');

-- ----------------------------
-- Table structure for `t_ltsm`
-- ----------------------------
DROP TABLE IF EXISTS `t_ltsm`;
CREATE TABLE `t_ltsm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='论坛说明';

-- ----------------------------
-- Records of t_ltsm
-- ----------------------------
INSERT INTO t_ltsm VALUES ('15', '<div class=\"text-title\" style=\"border: 0px; margin: 0px; padding: 0px; font-size: 12px; position: relative; top: -6px; color: rgb(102, 102, 102); font-family: \">\r\n<p><img alt=\"heart\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/heart.gif\" style=\"height:20px; width:20px\" title=\"heart\" /></p>\r\n\r\n<p><span style=\"color:#EE82EE\"><span style=\"font-size:24px\">小仙女们，我们一起护肤吧！！！</span></span><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/71ee0ed637e3400293540e706cee98b8_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px; vertical-align:middle\" /></p>\r\n\r\n<p>根据皮肤四大基本要素分型：<strong>油性/干性、敏感/耐受、色素/非色素、皱纹/紧</strong>致等，将皮肤分为2*2*2*2=<strong>16类</strong>。</p>\r\n\r\n<p>科学分析肤质，<strong>肌肤类型的分类比我们想象中要多</strong>，每个测试大约有十几个小问题，费点时间也要好好填写哦～</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/f0448964389f470f8182a98d4644c346_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px; vertical-align:middle\" /></p>\r\n\r\n<p>全部回答之后就会得出你的肤质类型，之后还会给出<strong>护肤指南</strong>和推荐<strong>个人的长草清单</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/54bb341cc31549aba81913b9b5cbe8eb_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px; vertical-align:middle\" /></p>\r\n\r\n<p>根据给我萌推荐的单品，我们还可以<strong>查产品详情</strong>，剁手路上更快乐～更是孕妈护肤必备，查成分一目了然。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/540ce77aa1ea4f8faea1f33b3868df3c_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px; vertical-align:middle\" /></p>\r\n\r\n<p><strong>美肤家</strong></p>\r\n\r\n<p>论产品成分分析和肤质测试，美丽修行比美肤家做得要好。</p>\r\n\r\n<p>但美肤家也有她的特点，比如有<strong>图集和视频专区</strong>，界面非常清新自然，看起来更舒服，其实<strong>和美丽修行搭配使用是最好的</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/f68b14fd579f46cf9467d2f8a8b20898_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; padding:0px; vertical-align:middle\" /></p>\r\n\r\n<p><strong>社区建设得挺好的</strong>，可以看到不少人拿到<strong>护肤品后的试用报告</strong>，很多都写得挺用心的，各位小仙女要剁手的时候不失为一个很好的参考。</p>\r\n\r\n<p>在社区里还可以提问，有专业的老师可以解答你的问题。</p>\r\n\r\n<p><img alt=\"\" src=\"http://img.mp.itc.cn/upload/20170610/4c2281c3316e452ca7180258d1aba70f_th.jpg\" style=\"border:0px; display:block; height:auto; margin:10px auto 0px; max-width:100%; opacity:0.9; padding:0px; vertical-align:middle\" /></p>\r\n</div>\r\n');

-- ----------------------------
-- Table structure for `t_mgc`
-- ----------------------------
DROP TABLE IF EXISTS `t_mgc`;
CREATE TABLE `t_mgc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mgc` varchar(100) DEFAULT NULL COMMENT '敏感词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='敏感词';



-- ----------------------------
-- Table structure for `t_pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `t_pinglun`;
CREATE TABLE `t_pinglun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wdxxId` int(11) DEFAULT NULL COMMENT '评论信息',
  `customerId` int(11) DEFAULT NULL COMMENT '评论人',
  `content` text COMMENT '评论内容',
  `insertDate` datetime DEFAULT NULL COMMENT '评论日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of t_pinglun
-- ----------------------------

INSERT INTO t_pinglun VALUES ('20', '7', '10', 'lklklklklklklk', '2019-11-29 23:31:11');
INSERT INTO t_pinglun VALUES ('22', '6', '13', 'lalalal', '2020-02-23 00:29:41');
INSERT INTO t_pinglun VALUES ('24', '14', '11', '卡姿兰确实好用 好用', '2020-02-23 17:44:49');
INSERT INTO t_pinglun VALUES ('25', '15', '14', '欢迎姐妹们来评价', '2020-02-23 21:23:56');
INSERT INTO t_pinglun VALUES ('26', '16', '15', '欢迎小伙伴们评论', '2020-02-23 23:51:33');
INSERT INTO t_pinglun VALUES ('29', '4', '14', 'qq', '2020-03-17 21:14:48');
INSERT INTO t_pinglun VALUES ('30', '16', '14', 'aa\r\n', '2020-03-17 21:15:11');
INSERT INTO t_pinglun VALUES ('31', '16', '29', '', '2020-04-10 21:17:58');
INSERT INTO t_pinglun VALUES ('32', '24', '28', '姐妹们，这个颜色绝美！', '2020-05-10 11:13:18');
INSERT INTO t_pinglun VALUES ('33', '26', '14', '快来 对比下 你的大粉水吧', '2020-05-10 15:08:38');
INSERT INTO t_pinglun VALUES ('34', '33', '30', '真好 用', '2020-05-24 10:37:03');
INSERT INTO t_pinglun VALUES ('35', '34', '31', '真好', '2020-05-24 10:48:45');
INSERT INTO t_pinglun VALUES ('36', '32', '31', '小仙女', '2020-05-24 10:50:44');

-- ----------------------------
-- Table structure for `t_sc`
-- ----------------------------
DROP TABLE IF EXISTS `t_sc`;
CREATE TABLE `t_sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL COMMENT '用户',
  `wdxxId` int(11) DEFAULT NULL COMMENT '文章',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sc
-- ----------------------------
INSERT INTO t_sc VALUES ('2', '3', '12');
INSERT INTO t_sc VALUES ('3', '10', '7');
INSERT INTO t_sc VALUES ('6', '13', '10');
INSERT INTO t_sc VALUES ('7', '13', '14');
INSERT INTO t_sc VALUES ('8', '16', '14');
INSERT INTO t_sc VALUES ('9', '14', '16');
INSERT INTO t_sc VALUES ('10', '11', '20');
INSERT INTO t_sc VALUES ('11', '28', '32');
INSERT INTO t_sc VALUES ('14', '31', '32');

-- ----------------------------
-- Table structure for `t_wdxx`
-- ----------------------------
DROP TABLE IF EXISTS `t_wdxx`;
CREATE TABLE `t_wdxx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL COMMENT '我',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `content` text COMMENT '内容',
  `zan` int(11) DEFAULT NULL COMMENT '赞',
  `insertDate` datetime DEFAULT NULL COMMENT '发布日期',
  `nologin` varchar(50) DEFAULT NULL COMMENT '游客是否可见',
  `bkId` int(11) DEFAULT NULL,
  `ship` varchar(100) DEFAULT NULL,
  `cpmc` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `cf` text COMMENT '成分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='我的消息';

-- ----------------------------
-- Records of t_wdxx
-- ----------------------------

INSERT INTO t_wdxx VALUES ('16', '15', '小草莓唇膏', 'upload/20200223/158247288107166.png', '<p><span style=\"color:#FF0000\"><span style=\"font-family:幼圆\"><img alt=\"heart\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/heart.gif\" style=\"height:20px; width:20px\" title=\"heart\" /><strong><u><em>涂完嘴巴嘟嘟嘟</em></u></strong></span></span></p>\r\n', '0', '2020-02-23 23:50:20', '是', '10', 'upload/20200223/158247301555588.mp4', '小草莓唇膏', null);
INSERT INTO t_wdxx VALUES ('21', '28', '草莓唇膏，你值得拥有哦！', 'upload/20200407/158625920046052.png', '<p><span style=\"font-size:24px\"><span style=\"font-family:幼圆\"><strong><img alt=\"kiss\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/kiss.gif\" style=\"height:20px; width:20px\" title=\"kiss\" />嘟嘟嘟，香甜小唇膏&nbsp;&nbsp;</strong></span></span></p>\r\n', '0', '2020-04-07 19:42:56', '是', '10', 'upload/20200407/158625972438553.mp4', '泰国唇膏', null);
INSERT INTO t_wdxx VALUES ('24', '28', '迪奥口红999 ,女王的颜色！', 'upload/20200510/158908011435418.png', '<p><span style=\"font-size:22px\"><strong><span style=\"font-family:隶书\"><span style=\"background-color:#FF8C00\">无论是经典缎光,优雅哑光,前卫金属光,烈艳蓝金999始终是迪奥传奇红唇的经典诠释.烈艳蓝金,红唇誓爱</span></span></strong></span></p>\r\n\r\n<p><span style=\"font-size:22px\"><strong><span style=\"font-family:隶书\"><span style=\"background-color:#FF8C00\">独特的液态丝绒哑光唇釉,兼具光泽与雾面效果,尽享唇间丝绒华服.诞于高定后台,灵感源自高级天鹅绒面料,大胆突破传统质感与妆效的束缚,改写唇妆历史.</span></span></strong></span></p>\r\n\r\n<p><span style=\"font-size:22px\"><strong><span style=\"font-family:隶书\"><span style=\"background-color:#FF8C00\"><img alt=\"kiss\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/kiss.gif\" style=\"height:20px; width:20px\" title=\"kiss\" /></span></span></strong></span></p>\r\n', '0', '2020-05-10 11:11:58', '是', '10', 'upload/20200510/158908026588048.mp4', '迪奥999', null);
INSERT INTO t_wdxx VALUES ('25', '22', '雅诗兰黛小棕瓶精华 ，你涂对了吗？', 'upload/20200510/158908066251274.PNG', '<p><span style=\"color:#A52A2A\"><em>&nbsp; &nbsp;雅诗兰黛小棕瓶一瓶精华凝萃，开启全能全效的护眼体验！饱含点滴ANR修护精华，强效能量深透眼周肌肤，根源改善细纹、皱纹、浮肿、黑眼圈、干燥及肤色不均6大问题，抵御各类岁月侵袭，24小时全天呵护与修护年轻明眸。全新即时修护特润眼部精华包含首次在特润修护系列中使用的独创同步修复技术，帮助支持肌肤细胞在精准时间自我修复的天然同步机制。因此，眼周的细纹和皱纹随时间逐渐减淡。</em></span></p>\r\n\r\n<p><span style=\"color:#A52A2A\"><em>根据视频一起学习以下吧！！！<img alt=\"smiley\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/regular_smile.gif\" style=\"height:20px; width:20px\" title=\"smiley\" /></em></span></p>\r\n', '0', '2020-05-10 11:20:03', '是', '5', 'upload/20200510/158908114191517.mp4', '雅思兰黛小棕瓶', '抗老精华');
INSERT INTO t_wdxx VALUES ('26', '14', '兰蔻粉水可收缩水，你买的是真的吗？', 'upload/20200510/158909434837134.PNG', '<p><span style=\"color:#EE82EE\"><span style=\"font-family:仿宋_gb2312\"><u>兰蔻粉水有着一个很神奇的功效，那就是它的收缩毛孔的功能。大家联系使用四个星期I后，就可以发现原来毛孔粗大的现象得到改善，即便是素颜也能使毛孔隐形，从而打造零毛孔的完美肌肤。这是因为兰蔻粉水可以调节皮肤的水油平衡，而毛孔粗大主要是因为皮肤的水油失衡所引起的，所以兰蔻粉水的特性正好可以对毛孔粗大对症下药，这样就能有效收缩脸上毛孔了。</u></span></span></p>\r\n\r\n<p><span style=\"color:#EE82EE\"><span style=\"font-family:仿宋_gb2312\"><u>大孔星人的救星！<img alt=\"heart\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/heart.gif\" style=\"height:20px; width:20px\" title=\"heart\" /></u></span></span></p>\r\n', '0', '2020-05-10 15:07:43', '是', '4', 'upload/20200510/158909445923894.mp4', '兰蔻', '氨基酸 玻尿酸');
INSERT INTO t_wdxx VALUES ('27', '28', '阿道夫 洗完 香喷喷，小仙女必备', 'upload/20200510/158909480681230.PNG', '<p><span style=\"color:#DAA520\"><span style=\"font-size:14px\"><strong>&nbsp; &nbsp; &nbsp;洗发水是指一种具有去头屑功能、 焗油功能和染发等功能的护发产品。洗发水中含有多种成分，这些成份的综合作用能起到清洁头皮和头发的功能。通常洗发露中最能起作用的成份是表面活性剂，表面活性剂起着清洁头发和头皮的作用，当洗发液与水混在一起时能产生泡沫，不过泡沫的多少并不能反映出清洁能力的强弱</strong></span></span>。</p>\r\n\r\n<p>一起做香香公主吧！<img alt=\"yes\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/thumbs_up.gif\" style=\"height:20px; width:20px\" title=\"yes\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n', '0', '2020-05-10 15:15:02', '是', '3', 'upload/20200510/158909489533475.mp4', '阿道夫', '清洁因子');
INSERT INTO t_wdxx VALUES ('28', '17', '香奈儿山茶花洗面奶 ，洗出白白脸', 'upload/20200510/158909514182459.PNG', '<p>香奈儿奢华精萃活肤系列产品，升华洁面艺术：带来精致、纯粹的愉悦享受，塑造美丽动人的肌肤。主要配方为珍贵山茶花与荷荷巴油，为肌肤带来舒缓享受，舒适感无与伦比。&nbsp;</p>\r\n\r\n<p>点赞<img alt=\"yes\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/thumbs_up.gif\" style=\"height:20px; width:20px\" title=\"yes\" /></p>\r\n', '0', '2020-05-10 15:20:32', '是', '3', 'upload/20200510/15890951843714.mp4', '香奈儿洗面奶', '洁面因子');
INSERT INTO t_wdxx VALUES ('29', '16', '贝德玛卸妆水  吐槽    不好用', 'upload/20200510/158909558736915.PNG', '<p><span style=\"font-size:11px\"><span style=\"font-family:幼圆\">贝德玛卸妆水由法国崭新科技 MICELLE 配方组成 , 内含水溶及油溶份子来可全面洗净肌肤毛孔内外污垢，再加上青瓜植物精华，用後绝不绷紧。成份简单，不含香料，敏感肌肤亦可使用．专利 MICELLE 洁肤配方「 BIODERMA 洁肤水」的 Micelle 溶妆粒子，特有水溶及油溶份子，可溶解面上及毛孔内的的污垢。</span></span></p>\r\n\r\n<p>&nbsp;上边是官网上的介绍内容，但是我今天要给姐妹们，<strong><span style=\"font-size:20px\">拔草 不好用！！！</span></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', '0', '2020-05-10 15:29:27', '是', '6', 'upload/20200510/15890957498685.mp4', '贝德玛', '卸妆因子');
INSERT INTO t_wdxx VALUES ('30', '16', '纪梵希散粉 粉中贵族', 'upload/20200510/158909624698545.PNG', '<p><span style=\"font-size:20px\"><span style=\"font-family:隶书\">纪梵希散粉色号共有6种，提供给不同肤色特点的女士选用，分别为：1色号为轻柔淡彩、2色号为精制米色、3色号为甜蜜焦糖、4色号为温柔阳光、5色号为柔和白色、6色号为清新玫瑰。</span></span></p>\r\n\r\n<p><span style=\"font-size:20px\"><span style=\"font-family:隶书\"><img alt=\"wink\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/wink_smile.gif\" style=\"height:20px; width:20px\" title=\"wink\" /></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n', '0', '2020-05-10 15:38:45', '是', '10', 'upload/20200510/158909631599812.mp4', '纪梵希散粉', '定妆粉');
INSERT INTO t_wdxx VALUES ('31', '28', '夏天必备 ，安耐晒小金瓶', 'upload/20200520/158996420440061.PNG', '<p><span style=\"color:#DAA520\"><span style=\"font-size:14px\"><span style=\"font-family:隶书\">&nbsp; 安热沙防晒露，俗称安热沙小金甁，属于清爽、防水型防晒露，是安热沙明星级的防晒单品。&nbsp;<br />\r\n&nbsp; 强效防晒：采用多重防晒&alpha;技术，其中特别强化对紫外线A波的防护效果，保护受损肌肤，远离紫外线损失，保持妇幼弹性肌肤。&nbsp;持续干爽：易于涂抹，涂抹后给肌肤加上一层保护膜，不黏腻。防水易卸：采用WP&amp;EW技术，虽为防水型防晒产品，但可以使用一般洁净品将其洗净。 &nbsp;</span></span></span></p>\r\n\r\n<p><span style=\"color:#DAA520\"><span style=\"font-family:隶书\"><img alt=\"yes\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/thumbs_up.gif\" style=\"height:20px; width:20px\" title=\"yes\" /></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n', '0', '2020-05-20 16:45:35', '是', '9', '', '安耐晒小金瓶', '防嗮因子');
INSERT INTO t_wdxx VALUES ('32', '28', '美白又防晒 ，安耐晒小白瓶', 'upload/20200520/158996445021379.PNG', '<p><span style=\"color:#EE82EE\"><span style=\"font-size:14px\"><span style=\"font-family:幼圆\">这是一款每日可以使用的美白防晒品，运用UV完全阻隔配方和光能量科技，<br />\r\n升级抵御紫外线能力，完全阻隔抵达地面的一切紫外线。&nbsp;添加凝血酸和维C，从根源上阻断黑色素生成，保持肌肤白皙透润。同时内含橄榄树叶精华和姜黄精成分，能够有效地对抗肌肤老化及干燥现象，尤其是光老化。&nbsp;</span></span></span></p>\r\n\r\n<p><span style=\"color:#EE82EE\"><span style=\"font-size:14px\"><span style=\"font-family:幼圆\"><img alt=\"enlightened\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/lightbulb.gif\" style=\"height:20px; width:20px\" title=\"enlightened\" /></span></span></span></p>\r\n', '0', '2020-05-20 16:48:35', '是', '9', '', '安耐晒', '防嗮因子');
INSERT INTO t_wdxx VALUES ('33', '30', '雅诗兰黛 ', 'upload/20200524/159028760849085.PNG', '<p><span style=\"color:#FFD700\"><span style=\"font-size:48px\"><span style=\"font-family:隶书\">好用的面霜精华<img alt=\"kiss\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/kiss.gif\" style=\"height:20px; width:20px\" title=\"kiss\" /></span></span></span></p>\r\n', '0', '2020-05-24 10:36:03', '是', '5', 'upload/20200524/159028808769854.mp4', '雅诗兰黛小棕瓶', '玻尿酸');
INSERT INTO t_wdxx VALUES ('34', '31', '兰蔻', 'upload/20200524/159028833164417.PNG', '<p><span style=\"font-size:14px\"><span style=\"font-family:隶书\">真的很好哟<img alt=\"heart\" src=\"http://localhost:8080/bn10/resource/plugin/ckeditor/plugins/smiley/images/heart.gif\" style=\"height:20px; width:20px\" title=\"heart\" />&nbsp; &nbsp;对比真假吧</span></span></p>\r\n', '0', '2020-05-24 10:47:34', '是', '4', 'upload/20200524/159028842238296.mp4', '大粉水', '收缩水');

-- ----------------------------
-- Table structure for `t_wdxx_click`
-- ----------------------------
DROP TABLE IF EXISTS `t_wdxx_click`;
CREATE TABLE `t_wdxx_click` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wdxxId` int(11) DEFAULT NULL COMMENT '内容',
  `customerId` int(11) DEFAULT NULL COMMENT '操作人',
  `insertDate` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='内容点击';

-- ----------------------------
-- Records of t_wdxx_click
-- ----------------------------
INSERT INTO t_wdxx_click VALUES ('1', '6', '13', '2020-02-23 00:29:20');
INSERT INTO t_wdxx_click VALUES ('2', '6', '13', '2020-02-23 00:29:43');
INSERT INTO t_wdxx_click VALUES ('3', '6', '13', '2020-02-23 00:29:47');
INSERT INTO t_wdxx_click VALUES ('4', '5', '13', '2020-02-23 00:43:07');
INSERT INTO t_wdxx_click VALUES ('5', '10', '13', '2020-02-23 01:13:15');
INSERT INTO t_wdxx_click VALUES ('6', '10', '13', '2020-02-23 01:13:28');
INSERT INTO t_wdxx_click VALUES ('7', '10', '13', '2020-02-23 01:13:31');
INSERT INTO t_wdxx_click VALUES ('8', '8', '13', '2020-02-23 01:14:18');
INSERT INTO t_wdxx_click VALUES ('9', '8', '13', '2020-02-23 01:14:26');
INSERT INTO t_wdxx_click VALUES ('10', '13', '13', '2020-02-23 10:51:23');
INSERT INTO t_wdxx_click VALUES ('11', '12', '13', '2020-02-23 16:39:46');
INSERT INTO t_wdxx_click VALUES ('12', '12', '13', '2020-02-23 16:39:55');
INSERT INTO t_wdxx_click VALUES ('13', '7', '13', '2020-02-23 16:41:54');
INSERT INTO t_wdxx_click VALUES ('14', '14', '13', '2020-02-23 17:19:03');
INSERT INTO t_wdxx_click VALUES ('15', '14', '13', '2020-02-23 17:19:38');
INSERT INTO t_wdxx_click VALUES ('16', '14', '13', '2020-02-23 17:20:11');
INSERT INTO t_wdxx_click VALUES ('17', '14', '13', '2020-02-23 17:20:44');
INSERT INTO t_wdxx_click VALUES ('18', '13', '13', '2020-02-23 17:22:46');
INSERT INTO t_wdxx_click VALUES ('19', '11', '13', '2020-02-23 17:23:15');
INSERT INTO t_wdxx_click VALUES ('20', '14', '11', '2020-02-23 17:44:02');
INSERT INTO t_wdxx_click VALUES ('21', '14', '11', '2020-02-23 17:44:11');
INSERT INTO t_wdxx_click VALUES ('22', '14', '11', '2020-02-23 17:44:18');
INSERT INTO t_wdxx_click VALUES ('23', '14', '11', '2020-02-23 17:44:52');
INSERT INTO t_wdxx_click VALUES ('24', '14', '11', '2020-02-23 17:45:01');
INSERT INTO t_wdxx_click VALUES ('25', '14', '11', '2020-02-23 17:45:25');
INSERT INTO t_wdxx_click VALUES ('26', '12', '11', '2020-02-23 17:45:57');
INSERT INTO t_wdxx_click VALUES ('27', '12', '11', '2020-02-23 17:46:05');
INSERT INTO t_wdxx_click VALUES ('28', '14', '11', '2020-02-23 17:49:30');
INSERT INTO t_wdxx_click VALUES ('29', '14', '11', '2020-02-23 17:49:37');
INSERT INTO t_wdxx_click VALUES ('30', '14', '11', '2020-02-23 17:49:53');
INSERT INTO t_wdxx_click VALUES ('31', '14', '11', '2020-02-23 17:50:36');
INSERT INTO t_wdxx_click VALUES ('32', '14', '11', '2020-02-23 17:50:47');
INSERT INTO t_wdxx_click VALUES ('33', '12', '11', '2020-02-23 17:52:37');
INSERT INTO t_wdxx_click VALUES ('34', '12', '11', '2020-02-23 17:52:43');
INSERT INTO t_wdxx_click VALUES ('35', '14', '11', '2020-02-23 18:14:24');
INSERT INTO t_wdxx_click VALUES ('36', '14', '11', '2020-02-23 18:17:14');
INSERT INTO t_wdxx_click VALUES ('37', '14', '11', '2020-02-23 18:18:06');
INSERT INTO t_wdxx_click VALUES ('38', '14', '11', '2020-02-23 18:28:57');
INSERT INTO t_wdxx_click VALUES ('39', '12', '11', '2020-02-23 18:29:27');
INSERT INTO t_wdxx_click VALUES ('40', '12', '11', '2020-02-23 18:29:33');
INSERT INTO t_wdxx_click VALUES ('41', '12', '11', '2020-02-23 18:29:34');
INSERT INTO t_wdxx_click VALUES ('42', '12', '11', '2020-02-23 18:29:37');
INSERT INTO t_wdxx_click VALUES ('43', '14', '11', '2020-02-23 18:30:01');
INSERT INTO t_wdxx_click VALUES ('44', '14', '11', '2020-02-23 18:30:10');
INSERT INTO t_wdxx_click VALUES ('45', '14', '11', '2020-02-23 18:30:27');
INSERT INTO t_wdxx_click VALUES ('46', '14', '11', '2020-02-23 18:30:51');
INSERT INTO t_wdxx_click VALUES ('47', '14', '11', '2020-02-23 18:31:13');
INSERT INTO t_wdxx_click VALUES ('48', '14', '11', '2020-02-23 18:31:17');
INSERT INTO t_wdxx_click VALUES ('49', '14', '11', '2020-02-23 18:31:56');
INSERT INTO t_wdxx_click VALUES ('50', '14', '11', '2020-02-23 18:32:34');
INSERT INTO t_wdxx_click VALUES ('51', '12', '11', '2020-02-23 18:33:54');
INSERT INTO t_wdxx_click VALUES ('52', '12', '11', '2020-02-23 18:36:48');
INSERT INTO t_wdxx_click VALUES ('53', '14', '13', '2020-02-23 20:01:28');
INSERT INTO t_wdxx_click VALUES ('54', '6', '13', '2020-02-23 20:02:37');
INSERT INTO t_wdxx_click VALUES ('55', '14', '13', '2020-02-23 20:03:50');
INSERT INTO t_wdxx_click VALUES ('56', '14', '13', '2020-02-23 20:10:08');
INSERT INTO t_wdxx_click VALUES ('57', '14', '13', '2020-02-23 20:10:16');
INSERT INTO t_wdxx_click VALUES ('58', '14', '13', '2020-02-23 20:12:32');
INSERT INTO t_wdxx_click VALUES ('59', '14', '13', '2020-02-23 20:12:40');
INSERT INTO t_wdxx_click VALUES ('60', '14', '13', '2020-02-23 20:12:46');
INSERT INTO t_wdxx_click VALUES ('61', '14', '13', '2020-02-23 20:13:41');
INSERT INTO t_wdxx_click VALUES ('62', '12', '13', '2020-02-23 20:13:48');
INSERT INTO t_wdxx_click VALUES ('63', '14', '13', '2020-02-23 20:15:01');
INSERT INTO t_wdxx_click VALUES ('64', '12', '13', '2020-02-23 20:15:12');
INSERT INTO t_wdxx_click VALUES ('65', '15', '14', '2020-02-23 21:23:00');
INSERT INTO t_wdxx_click VALUES ('66', '15', '14', '2020-02-23 21:23:28');
INSERT INTO t_wdxx_click VALUES ('67', '15', '14', '2020-02-23 21:23:59');
INSERT INTO t_wdxx_click VALUES ('68', '15', '14', '2020-02-23 21:24:53');
INSERT INTO t_wdxx_click VALUES ('69', '15', '14', '2020-02-23 21:35:50');
INSERT INTO t_wdxx_click VALUES ('70', '15', '14', '2020-02-23 21:37:28');
INSERT INTO t_wdxx_click VALUES ('71', '15', '14', '2020-02-23 21:37:44');
INSERT INTO t_wdxx_click VALUES ('72', '15', '14', '2020-02-23 21:38:10');
INSERT INTO t_wdxx_click VALUES ('73', '15', '15', '2020-02-23 23:45:46');
INSERT INTO t_wdxx_click VALUES ('74', '16', '15', '2020-02-23 23:50:49');
INSERT INTO t_wdxx_click VALUES ('75', '16', '15', '2020-02-23 23:51:36');
INSERT INTO t_wdxx_click VALUES ('76', '16', '15', '2020-02-23 23:51:45');
INSERT INTO t_wdxx_click VALUES ('77', '16', '15', '2020-02-23 23:51:53');
INSERT INTO t_wdxx_click VALUES ('78', '16', '15', '2020-02-23 23:51:59');
INSERT INTO t_wdxx_click VALUES ('79', '4', '14', '2020-03-17 21:11:02');
INSERT INTO t_wdxx_click VALUES ('80', '4', '14', '2020-03-17 21:13:16');
INSERT INTO t_wdxx_click VALUES ('81', '4', '14', '2020-03-17 21:14:49');
INSERT INTO t_wdxx_click VALUES ('82', '16', '14', '2020-03-17 21:15:02');
INSERT INTO t_wdxx_click VALUES ('83', '16', '14', '2020-03-17 21:15:13');
INSERT INTO t_wdxx_click VALUES ('84', '16', '16', '2020-03-17 21:16:27');
INSERT INTO t_wdxx_click VALUES ('85', '16', '16', '2020-03-17 21:16:35');
INSERT INTO t_wdxx_click VALUES ('86', '14', '16', '2020-03-17 21:20:05');
INSERT INTO t_wdxx_click VALUES ('87', '14', '16', '2020-03-17 21:21:09');
INSERT INTO t_wdxx_click VALUES ('88', '14', '16', '2020-03-17 21:21:13');
INSERT INTO t_wdxx_click VALUES ('89', '14', '16', '2020-03-17 21:21:21');
INSERT INTO t_wdxx_click VALUES ('90', '14', '16', '2020-03-17 21:22:00');
INSERT INTO t_wdxx_click VALUES ('91', '14', '16', '2020-03-17 21:22:13');
INSERT INTO t_wdxx_click VALUES ('92', '3', '16', '2020-03-17 21:50:23');
INSERT INTO t_wdxx_click VALUES ('93', '7', '16', '2020-03-17 21:51:07');
INSERT INTO t_wdxx_click VALUES ('94', '14', '16', '2020-03-18 23:04:41');
INSERT INTO t_wdxx_click VALUES ('95', '14', '16', '2020-03-18 23:04:54');
INSERT INTO t_wdxx_click VALUES ('96', '16', '15', '2020-03-18 23:05:53');
INSERT INTO t_wdxx_click VALUES ('97', '7', '15', '2020-03-18 23:27:27');
INSERT INTO t_wdxx_click VALUES ('98', '7', '15', '2020-03-18 23:29:25');
INSERT INTO t_wdxx_click VALUES ('99', '16', '15', '2020-03-18 23:29:50');
INSERT INTO t_wdxx_click VALUES ('100', '16', '15', '2020-03-18 23:31:41');
INSERT INTO t_wdxx_click VALUES ('101', '7', '15', '2020-03-18 23:31:46');
INSERT INTO t_wdxx_click VALUES ('102', '10', '15', '2020-03-18 23:32:40');
INSERT INTO t_wdxx_click VALUES ('103', '17', '14', '2020-03-19 10:50:47');
INSERT INTO t_wdxx_click VALUES ('104', '16', '14', '2020-03-19 12:26:50');
INSERT INTO t_wdxx_click VALUES ('105', '16', '14', '2020-03-19 12:28:11');
INSERT INTO t_wdxx_click VALUES ('106', '16', '14', '2020-03-19 12:28:19');
INSERT INTO t_wdxx_click VALUES ('107', '16', '14', '2020-03-19 12:29:26');
INSERT INTO t_wdxx_click VALUES ('108', '16', '14', '2020-03-19 12:31:51');
INSERT INTO t_wdxx_click VALUES ('109', '12', '14', '2020-03-19 12:32:36');
INSERT INTO t_wdxx_click VALUES ('110', '18', '14', '2020-03-19 14:17:24');
INSERT INTO t_wdxx_click VALUES ('111', '12', '14', '2020-03-19 21:56:55');
INSERT INTO t_wdxx_click VALUES ('112', '12', '14', '2020-03-19 21:57:00');
INSERT INTO t_wdxx_click VALUES ('113', '16', '14', '2020-03-19 21:57:15');
INSERT INTO t_wdxx_click VALUES ('114', '16', '14', '2020-03-19 21:57:20');
INSERT INTO t_wdxx_click VALUES ('115', '12', '14', '2020-03-19 21:58:56');
INSERT INTO t_wdxx_click VALUES ('116', '15', '17', '2020-03-20 19:07:28');
INSERT INTO t_wdxx_click VALUES ('117', '15', '17', '2020-03-20 19:07:49');
INSERT INTO t_wdxx_click VALUES ('118', '18', '17', '2020-03-29 19:14:02');
INSERT INTO t_wdxx_click VALUES ('119', '16', '17', '2020-03-29 19:14:12');
INSERT INTO t_wdxx_click VALUES ('120', '4', '26', '2020-03-30 20:28:59');
INSERT INTO t_wdxx_click VALUES ('121', '19', '27', '2020-04-04 21:21:44');
INSERT INTO t_wdxx_click VALUES ('122', '13', '11', '2020-04-04 21:51:32');
INSERT INTO t_wdxx_click VALUES ('123', '20', '11', '2020-04-04 22:05:36');
INSERT INTO t_wdxx_click VALUES ('124', '20', '11', '2020-04-04 22:05:39');
INSERT INTO t_wdxx_click VALUES ('125', '19', '28', '2020-04-07 22:00:20');
INSERT INTO t_wdxx_click VALUES ('126', '16', '29', '2020-04-10 21:12:55');
INSERT INTO t_wdxx_click VALUES ('127', '16', '29', '2020-04-10 21:18:01');
INSERT INTO t_wdxx_click VALUES ('128', '24', '28', '2020-05-10 11:12:19');
INSERT INTO t_wdxx_click VALUES ('129', '24', '28', '2020-05-10 11:13:19');
INSERT INTO t_wdxx_click VALUES ('130', '25', '22', '2020-05-10 11:33:25');
INSERT INTO t_wdxx_click VALUES ('131', '25', '22', '2020-05-10 11:34:35');
INSERT INTO t_wdxx_click VALUES ('132', '26', '14', '2020-05-10 15:07:58');
INSERT INTO t_wdxx_click VALUES ('133', '26', '14', '2020-05-10 15:08:41');
INSERT INTO t_wdxx_click VALUES ('134', '29', '16', '2020-05-10 15:30:15');
