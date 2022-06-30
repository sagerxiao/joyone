

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jone_collection
-- ----------------------------
DROP TABLE IF EXISTS `jone_collection`;
CREATE TABLE `jone_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `source_code` varchar(40) DEFAULT '0' COMMENT '任务ID',
  `member_code` varchar(40) DEFAULT '' COMMENT '成员id',
  `create_time` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏表';

-- ----------------------------
-- Table structure for jone_department
-- ----------------------------
DROP TABLE IF EXISTS `jone_department`;
CREATE TABLE `jone_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  `organization_code` varchar(40) DEFAULT NULL COMMENT '组织编号',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `pcode` varchar(40) DEFAULT '' COMMENT '上级编号',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `path` text COMMENT '上级路径',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Table structure for jone_department_member
-- ----------------------------
DROP TABLE IF EXISTS `jone_department_member`;
CREATE TABLE `jone_department_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT '' COMMENT 'id',
  `department_code` varchar(40) DEFAULT '' COMMENT '部门id',
  `organization_code` varchar(40) DEFAULT '' COMMENT '组织id',
  `account_code` varchar(40) DEFAULT '' COMMENT '成员id',
  `join_time` varchar(30) DEFAULT NULL COMMENT '加入时间',
  `is_principal` tinyint(1) DEFAULT NULL COMMENT '是否负责人',
  `is_owner` tinyint(1) DEFAULT '0' COMMENT '拥有者',
  `authorize` varchar(20) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门-成员表';

-- ----------------------------
-- Table structure for jone_file
-- ----------------------------
DROP TABLE IF EXISTS `jone_file`;
CREATE TABLE `jone_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT '' COMMENT '编号',
  `path_name` varchar(200) DEFAULT NULL COMMENT '相对路径',
  `title` char(90) DEFAULT NULL COMMENT '名称',
  `extension` char(30) DEFAULT NULL COMMENT '扩展名',
  `size` bigint(20) unsigned DEFAULT '0' COMMENT '文件大小',
  `object_type` char(30) DEFAULT NULL COMMENT '对象类型',
  `organization_code` varchar(40) DEFAULT '' COMMENT '组织编码',
  `task_code` varchar(40) DEFAULT NULL COMMENT '任务编码',
  `project_code` varchar(40) DEFAULT NULL COMMENT '项目编码',
  `create_by` varchar(40) DEFAULT NULL COMMENT '上传人',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `downloads` mediumint(8) unsigned DEFAULT '0' COMMENT '下载次数',
  `extra` varchar(255) DEFAULT NULL COMMENT '额外信息',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标记',
  `file_url` text COMMENT '完整地址',
  `file_type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  `deleted_time` varchar(30) DEFAULT '' COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件表';

-- ----------------------------
-- Table structure for jone_holiday
-- ----------------------------
DROP TABLE IF EXISTS `jone_holiday`;
CREATE TABLE `jone_holiday` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `date_str` varchar(40) DEFAULT '' COMMENT '日期',
  `description` varchar(48) DEFAULT NULL COMMENT '描述',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) NOT NULL COMMENT '创建时间',
  `update_time` varchar(30) NOT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8 COMMENT='假期(非工作日)表';

-- ----------------------------
-- Table structure for jone_invite_link
-- ----------------------------
DROP TABLE IF EXISTS `jone_invite_link`;
CREATE TABLE `jone_invite_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL COMMENT '邀请码',
  `create_by` varchar(40) DEFAULT NULL COMMENT '邀请人',
  `invite_type` varchar(20) DEFAULT NULL COMMENT '链接类型',
  `source_code` varchar(40) DEFAULT NULL COMMENT '资源编码',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `over_time` varchar(30) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='邀请链接表';

-- ----------------------------
-- Table structure for jone_member
-- ----------------------------
DROP TABLE IF EXISTS `jone_member`;
CREATE TABLE `jone_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `account` varchar(20) NOT NULL DEFAULT '' COMMENT '用户登陆账号',
  `password` char(32) DEFAULT '' COMMENT '登陆密码，32位加密串',
  `name` varchar(64) DEFAULT '' COMMENT '用户昵称',
  `mobile` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '手机',
  `realname` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '真实姓名',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `last_login_time` varchar(30) DEFAULT NULL COMMENT '上次登录时间',
  `sex` char(2) DEFAULT '' COMMENT '性别',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `idcard` varchar(32) DEFAULT NULL COMMENT '身份证',
  `province` int(11) DEFAULT '0' COMMENT '省',
  `city` int(11) DEFAULT '0' COMMENT '市',
  `area` int(11) DEFAULT '0' COMMENT '区',
  `address` varchar(255) DEFAULT NULL COMMENT '所在地址',
  `description` text CHARACTER SET utf8mb4 COMMENT '备注',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  `dingtalk_openid` varchar(50) DEFAULT NULL COMMENT '钉钉openid',
  `dingtalk_unionid` varchar(50) DEFAULT NULL COMMENT '钉钉unionid',
  `dingtalk_userid` varchar(50) DEFAULT NULL COMMENT '钉钉用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `username` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=685 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Table structure for jone_member_account
-- ----------------------------
DROP TABLE IF EXISTS `jone_member_account`;
CREATE TABLE `jone_member_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL,
  `member_code` varchar(40) DEFAULT '' COMMENT '所属账号id',
  `organization_code` varchar(40) DEFAULT '' COMMENT '所属组织',
  `department_code` varchar(500) DEFAULT '' COMMENT '部门编号',
  `authorize` varchar(20) DEFAULT NULL COMMENT '角色',
  `is_owner` tinyint(1) DEFAULT '0' COMMENT '是否主账号',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮件',
  `create_time` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `last_login_time` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='组织账号表';

-- ----------------------------
-- Table structure for jone_notify
-- ----------------------------
DROP TABLE IF EXISTS `jone_notify`;
CREATE TABLE `jone_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `type` enum('notice','message','task') DEFAULT NULL COMMENT '通知类型。通知：notice，消息：message，待办：task',
  `from` varchar(40) DEFAULT '0' COMMENT '发送人id',
  `to` varchar(40) DEFAULT '0' COMMENT '送达用户id',
  `create_time` varchar(30) DEFAULT NULL COMMENT '生成时间',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '是否已读',
  `read_time` varchar(30) DEFAULT NULL COMMENT '阅读时间',
  `send_data` text COMMENT '关联数据',
  `finally_send_time` varchar(30) DEFAULT NULL COMMENT '最终发送时间',
  `send_time` varchar(30) DEFAULT NULL COMMENT '发送时间',
  `action` varchar(32) DEFAULT 'none' COMMENT '场景：task，project',
  `terminal` varchar(32) DEFAULT NULL COMMENT '推送终端。pc端：project，移动端：wap',
  `from_type` varchar(32) DEFAULT NULL COMMENT '''project'',''system''',
  `avatar` varchar(1024) DEFAULT NULL COMMENT '头像/图片',
  `source_code` varchar(40) DEFAULT '0' COMMENT '资源code',
  `task_code` varchar(40) DEFAULT NULL COMMENT '任务单code',
  `project_code` varchar(40) DEFAULT NULL COMMENT '项目code',
  `work_item` varchar(40) DEFAULT NULL COMMENT '工作项',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4399 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='动态通知表';

-- ----------------------------
-- Table structure for jone_organization
-- ----------------------------
DROP TABLE IF EXISTS `jone_organization`;
CREATE TABLE `jone_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `owner_code` varchar(40) DEFAULT NULL COMMENT '拥有者',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `personal` tinyint(1) DEFAULT '0' COMMENT '是否个人项目',
  `code` varchar(40) DEFAULT '' COMMENT '编号',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `province` int(11) DEFAULT '0' COMMENT '省',
  `city` int(11) DEFAULT '0' COMMENT '市',
  `area` int(11) DEFAULT '0' COMMENT '区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='组织表';

-- ----------------------------
-- Table structure for jone_project
-- ----------------------------
DROP TABLE IF EXISTS `jone_project`;
CREATE TABLE `jone_project` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `name` varchar(90) DEFAULT NULL COMMENT '名称',
  `code` varchar(45) DEFAULT NULL COMMENT '编号',
  `description` text COMMENT '描述',
  `access_control_type` enum('open','private','custom') DEFAULT 'open' COMMENT '访问控制l类型',
  `white_list` varchar(255) DEFAULT NULL COMMENT '可以访问项目的权限组（白名单）',
  `order` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标记',
  `template_code` varchar(40) DEFAULT '' COMMENT '项目类型',
  `schedule` double(5,2) DEFAULT '0.00' COMMENT '进度',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `organization_code` varchar(40) DEFAULT '' COMMENT '组织id',
  `deleted_time` varchar(30) DEFAULT NULL COMMENT '删除时间',
  `private` tinyint(1) DEFAULT '1' COMMENT '是否私有',
  `prefix` varchar(10) DEFAULT NULL COMMENT '项目前缀',
  `open_prefix` tinyint(1) DEFAULT '0' COMMENT '是否开启项目前缀',
  `archive` tinyint(1) DEFAULT '0' COMMENT '是否归档',
  `archive_time` varchar(30) DEFAULT NULL COMMENT '归档时间',
  `open_begin_time` tinyint(1) DEFAULT '0' COMMENT '是否开启任务开始时间',
  `open_task_private` tinyint(1) DEFAULT '0' COMMENT '是否开启新任务默认开启隐私模式',
  `task_board_theme` varchar(32) DEFAULT 'default' COMMENT '看板风格',
  `begin_time` varchar(30) DEFAULT NULL COMMENT '项目开始日期',
  `end_time` varchar(30) DEFAULT NULL COMMENT '项目截止日期',
  `auto_update_schedule` tinyint(1) DEFAULT '0' COMMENT '自动更新项目进度',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `project` (`order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13094 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目表';

-- ----------------------------
-- Table structure for jone_project_auth
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_auth`;
CREATE TABLE `jone_project_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(5) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `organization_code` varchar(40) DEFAULT '' COMMENT '所属组织',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  `type` varchar(64) DEFAULT NULL COMMENT '权限类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目权限表';

-- ----------------------------
-- Table structure for jone_project_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_auth_node`;
CREATE TABLE `jone_project_auth_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) DEFAULT NULL COMMENT '节点路径',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30754 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目角色与节点绑定';

-- ----------------------------
-- Table structure for jone_project_collection
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_collection`;
CREATE TABLE `jone_project_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `project_code` varchar(40) DEFAULT '' COMMENT '项目id',
  `member_code` varchar(40) DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目-收藏表';

-- ----------------------------
-- Table structure for jone_project_features
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_features`;
CREATE TABLE `jone_project_features` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  `name` varchar(64) DEFAULT NULL COMMENT '版本库名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` varchar(30) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  `organization_code` varchar(40) DEFAULT '' COMMENT '组织id',
  `project_code` varchar(40) DEFAULT '' COMMENT '项目id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `project_code` (`project_code`) USING BTREE,
  KEY `organization_code` (`organization_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目版本库表';

-- ----------------------------
-- Table structure for jone_project_info
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_info`;
CREATE TABLE `jone_project_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` varchar(30) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  `organization_code` varchar(30) DEFAULT '' COMMENT '组织id',
  `project_code` varchar(30) DEFAULT '' COMMENT '项目id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `code` varchar(30) DEFAULT NULL COMMENT 'code',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `project_code` (`project_code`) USING BTREE,
  KEY `organization_code` (`organization_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目自定义信息表';

-- ----------------------------
-- Table structure for jone_project_log
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_log`;
CREATE TABLE `jone_project_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT '',
  `member_code` varchar(40) DEFAULT '0' COMMENT '操作人id',
  `content` text COMMENT '操作内容',
  `remark` text,
  `type` varchar(128) DEFAULT 'create' COMMENT '操作类型',
  `create_time` varchar(30) DEFAULT NULL COMMENT '添加时间',
  `source_code` varchar(40) DEFAULT '0' COMMENT '任务id',
  `action_type` varchar(30) DEFAULT NULL COMMENT '场景类型',
  `to_member_code` varchar(500) DEFAULT '0',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评论，0：否',
  `project_code` varchar(40) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `is_robot` tinyint(1) DEFAULT '0' COMMENT '是否机器人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `member_code` (`member_code`) USING BTREE,
  KEY `source_code` (`source_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8280 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目日志表';

-- ----------------------------
-- Table structure for jone_project_member
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_member`;
CREATE TABLE `jone_project_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `project_code` varchar(40) DEFAULT '' COMMENT '项目id',
  `member_code` varchar(40) DEFAULT '' COMMENT '成员id',
  `join_time` varchar(30) DEFAULT NULL COMMENT '加入时间',
  `is_owner` int(11) DEFAULT '0' COMMENT '拥有者',
  `authorize` varchar(20) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`project_code`,`member_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目-成员表';

-- ----------------------------
-- Table structure for jone_project_menu
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_menu`;
CREATE TABLE `jone_project_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `file_path` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `node` varchar(255) DEFAULT '#' COMMENT '权限节点',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `is_inner` tinyint(1) DEFAULT '0' COMMENT '是否内页',
  `values` varchar(64) DEFAULT NULL COMMENT '参数默认值',
  `show_slider` tinyint(1) DEFAULT '1' COMMENT '是否显示侧栏',
  `_values` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目菜单表';

-- ----------------------------
-- Table structure for jone_project_node
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_node`;
CREATE TABLE `jone_project_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(3) unsigned DEFAULT '0' COMMENT '是否可设置为菜单',
  `is_auth` tinyint(3) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `is_login` tinyint(3) unsigned DEFAULT '1' COMMENT '是否启动登录控制',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_node_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=703 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目端节点表';

-- ----------------------------
-- Table structure for jone_project_report
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_report`;
CREATE TABLE `jone_project_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `project_code` varchar(40) DEFAULT NULL COMMENT '项目编号',
  `date` varchar(30) DEFAULT NULL COMMENT '日期',
  `content` text,
  `create_time` varchar(30) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `union` (`project_code`,`date`) USING BTREE,
  KEY `code` (`project_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目报表统计表';

-- ----------------------------
-- Table structure for jone_project_template
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_template`;
CREATE TABLE `jone_project_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `description` text COMMENT '备注',
  `sort` tinyint(4) DEFAULT '0',
  `create_time` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  `organization_code` varchar(30) DEFAULT '' COMMENT '组织id',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `member_code` varchar(30) DEFAULT '' COMMENT '创建人',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '系统默认',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目类型表';

-- ----------------------------
-- Table structure for jone_project_version
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_version`;
CREATE TABLE `jone_project_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '版本库名称',
  `create_time` varchar(30) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  `features_code` varchar(40) DEFAULT NULL COMMENT '版本库编号',
  `project_code` varchar(40) DEFAULT NULL COMMENT '版本code',
  `organization_code` varchar(40) DEFAULT '' COMMENT '组织code',
  `start_time` varchar(30) DEFAULT NULL COMMENT '开始时间',
  `plan_start_time` varchar(30) DEFAULT NULL COMMENT '预计开始时间',
  `plan_bring_up_test_time` varchar(30) DEFAULT NULL COMMENT '预计提测时间',
  `bring_up_test_time` varchar(30) DEFAULT NULL COMMENT '提测时间',
  `test_start_time` varchar(32) DEFAULT NULL COMMENT '测试开始时间',
  `test_end_time` varchar(32) DEFAULT NULL COMMENT '测试结束时间',
  `plan_publish_time` varchar(30) DEFAULT NULL COMMENT '预计发布时间',
  `publish_time` varchar(30) DEFAULT NULL COMMENT '发布时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `schedule` int(11) DEFAULT '0' COMMENT '进度百分比',
  `product_leader` varchar(40) DEFAULT NULL COMMENT '产品负责人',
  `technology_leader` varchar(40) DEFAULT NULL COMMENT '技术负责人',
  `project_leader` varchar(40) DEFAULT NULL COMMENT '项目经理',
  `test_people` text COMMENT '测试人员用‘,’分隔',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `version_type` varchar(32) DEFAULT NULL COMMENT '版本类型 small;middle;large',
  `repulse_num` int(11) DEFAULT '0' COMMENT '版本打回次数',
  `work_item` varchar(32) DEFAULT NULL COMMENT '工作项',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `organization_code` (`organization_code`) USING BTREE,
  KEY `features_code` (`features_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目版本表';

-- ----------------------------
-- Table structure for jone_project_version_log
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_version_log`;
CREATE TABLE `jone_project_version_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT '',
  `member_code` varchar(40) DEFAULT NULL COMMENT '操作人id',
  `content` text COMMENT '操作内容',
  `remark` text COMMENT '日志描述',
  `type` varchar(64) DEFAULT 'create' COMMENT '操作类型',
  `create_time` varchar(30) DEFAULT NULL COMMENT '添加时间',
  `source_code` varchar(40) DEFAULT '0' COMMENT '任务id',
  `project_code` varchar(40) DEFAULT NULL COMMENT '项目编号',
  `icon` varchar(20) DEFAULT NULL,
  `features_code` varchar(40) DEFAULT NULL COMMENT '版本库编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `project_code` (`project_code`) USING BTREE,
  KEY `features_code` (`features_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目版本日志表';

-- ----------------------------
-- Table structure for jone_project_version_repulse
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_version_repulse`;
CREATE TABLE `jone_project_version_repulse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `version_code` varchar(40) DEFAULT NULL COMMENT '版本编码',
  `sort` int(3) NOT NULL DEFAULT '1' COMMENT '第几次打回',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1084 DEFAULT CHARSET=utf8 COMMENT='版本冒烟打回信息';

-- ----------------------------
-- Table structure for jone_project_version_repulse_bug
-- ----------------------------
DROP TABLE IF EXISTS `jone_project_version_repulse_bug`;
CREATE TABLE `jone_project_version_repulse_bug` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `version_repulse_id` bigint(11) NOT NULL COMMENT '冒烟打回id',
  `version_code` varchar(40) DEFAULT NULL COMMENT '版本编码',
  `task_code` varchar(40) DEFAULT NULL COMMENT '任务编号',
  `member_code` varchar(40) DEFAULT NULL COMMENT '责任人编号',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1083 DEFAULT CHARSET=utf8 COMMENT='版本冒烟打回bug数据';

-- ----------------------------
-- Table structure for jone_score_excute_log
-- ----------------------------
DROP TABLE IF EXISTS `jone_score_excute_log`;
CREATE TABLE `jone_score_excute_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_code` varchar(40) DEFAULT '' COMMENT '所属组织',
  `excute_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '执行类型 1-日常操作规范 2-质量和效率 3-连续一个月没有扣分',
  `member_codes` varchar(1024) DEFAULT NULL COMMENT '用户编号列表',
  `scores` varchar(48) DEFAULT NULL COMMENT '用户得分列表',
  `excute_date` varchar(40) DEFAULT '' COMMENT '执行日期',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=917 DEFAULT CHARSET=utf8 COMMENT='日常规则执行记录表';

-- ----------------------------
-- Table structure for jone_score_org_config
-- ----------------------------
DROP TABLE IF EXISTS `jone_score_org_config`;
CREATE TABLE `jone_score_org_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_code` varchar(40) DEFAULT '' COMMENT '所属组织',
  `period_type` int(2) DEFAULT NULL COMMENT '考核周期类型，1、月，2、季度',
  `statistical_time` timestamp NULL DEFAULT NULL COMMENT '每日积分统计时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8 COMMENT='组织基础设置表';

-- ----------------------------
-- Table structure for jone_score_period_log
-- ----------------------------
DROP TABLE IF EXISTS `jone_score_period_log`;
CREATE TABLE `jone_score_period_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_code` varchar(40) DEFAULT '' COMMENT '所属组织',
  `period_type` int(2) DEFAULT NULL COMMENT '考核周期类型，1、月，2、季度',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始生效时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束生效时间',
  `effective_marker` tinyint(4) DEFAULT NULL COMMENT '生效标记(1-已结束,2-当前生效,3-待生效)',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8 COMMENT='周期记录表';

-- ----------------------------
-- Table structure for jone_score_record
-- ----------------------------
DROP TABLE IF EXISTS `jone_score_record`;
CREATE TABLE `jone_score_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_code` varchar(40) DEFAULT '' COMMENT '所属组织',
  `member_code` varchar(48) DEFAULT NULL COMMENT '用户id',
  `rule_code` varchar(64) DEFAULT NULL COMMENT '规则编码',
  `rule_name` varchar(100) DEFAULT NULL COMMENT '规则名称',
  `score` int(3) NOT NULL DEFAULT '0' COMMENT '本次打分分值',
  `score_time` timestamp NULL DEFAULT NULL COMMENT '得分时间',
  `project_codes` text COMMENT '项目code列表',
  `version_codes` text COMMENT '版本code列表',
  `task_codes` text COMMENT '任务code列表',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注(记录问题,项目,版本等信息)',
  `operator` varchar(64) DEFAULT NULL COMMENT '操作人名称',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  `excute_log_id` bigint(20) DEFAULT NULL COMMENT '执行记录id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=utf8 COMMENT='得分记录表';

-- ----------------------------
-- Table structure for jone_score_rule_info
-- ----------------------------
DROP TABLE IF EXISTS `jone_score_rule_info`;
CREATE TABLE `jone_score_rule_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `org_code` varchar(40) DEFAULT '' COMMENT '所属组织',
  `pcode` varchar(40) DEFAULT NULL COMMENT '父规则编码',
  `code` varchar(40) DEFAULT NULL COMMENT '规则编码',
  `name` varchar(100) DEFAULT NULL COMMENT '规则描述',
  `product_manager` int(11) DEFAULT NULL COMMENT '产品经理扣分',
  `develop_manager` int(11) DEFAULT NULL COMMENT '开发经理扣分',
  `task_head` int(11) DEFAULT NULL COMMENT '开发责任人扣分',
  `state` tinyint(1) DEFAULT '1' COMMENT '规则状态（1-启用,0-停用）',
  `category` enum('TEAM_COLLABORATION','QUALITY_EFFICIENCY') DEFAULT NULL COMMENT '分类枚举',
  `config1` int(11) DEFAULT NULL COMMENT '可配置项1(无实际特定含义)',
  `config2` varchar(64) DEFAULT NULL COMMENT '可配置项2(无实际特定含义)',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=utf8 COMMENT='规则描述';

-- ----------------------------
-- Table structure for jone_source_link
-- ----------------------------
DROP TABLE IF EXISTS `jone_source_link`;
CREATE TABLE `jone_source_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  `source_type` char(40) DEFAULT NULL COMMENT '资源类型',
  `source_code` varchar(40) DEFAULT NULL COMMENT '资源编号',
  `link_type` char(20) DEFAULT NULL COMMENT '关联类型',
  `link_code` varchar(40) DEFAULT NULL COMMENT '关联编号',
  `organization_code` varchar(40) CHARACTER SET utf8 DEFAULT '' COMMENT '组织编码',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='资源关联表';

-- ----------------------------
-- Table structure for jone_system_config
-- ----------------------------
DROP TABLE IF EXISTS `jone_system_config`;
CREATE TABLE `jone_system_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(100) DEFAULT NULL COMMENT '配置编码',
  `value` varchar(500) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_config_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统参数配置';

-- ----------------------------
-- Table structure for jone_system_log
-- ----------------------------
DROP TABLE IF EXISTS `jone_system_log`;
CREATE TABLE `jone_system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统操作日志表';

-- ----------------------------
-- Table structure for jone_task
-- ----------------------------
DROP TABLE IF EXISTS `jone_task`;
CREATE TABLE `jone_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `id_num` int(11) DEFAULT '1' COMMENT '任务id编号',
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  `work_item` varchar(16) DEFAULT NULL COMMENT '工作项类',
  `project_code` varchar(40) NOT NULL DEFAULT '' COMMENT '项目编号',
  `name` varchar(64) DEFAULT NULL COMMENT '任务名称',
  `pri` tinyint(3) unsigned DEFAULT '0' COMMENT '紧急程度    ',
  `execute_status` enum('new','accept','doing','resolved','reopen','closed','pause') DEFAULT 'new' COMMENT '执行状态',
  `status` int(11) DEFAULT NULL COMMENT '执行状态\n0：新建，\n1：已接受，\n2：处理中，\n3：已解决，\n4：已验证,\n5：重新打开，\n6：拒绝\n7：挂起\n8：已关闭',
  `description` text COMMENT '详情',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建日期',
  `update_time` varchar(30) DEFAULT NULL COMMENT '更新时间',
  `assign_to` varchar(40) DEFAULT '' COMMENT '指派给谁',
  `dutyer` varchar(40) DEFAULT NULL COMMENT '责任人',
  `stage_code` varchar(40) DEFAULT '' COMMENT '任务列表Code',
  `task_tag` varchar(255) DEFAULT NULL COMMENT '任务标签',
  `done` tinyint(4) DEFAULT '0' COMMENT '是否完成 0:未完成 1:完成',
  `plan_begin_time` varchar(30) DEFAULT NULL COMMENT '预计开始时间',
  `begin_time` varchar(30) DEFAULT NULL COMMENT '开始时间',
  `remind_time` varchar(30) DEFAULT NULL COMMENT '提醒时间',
  `plan_finish_time` varchar(30) DEFAULT NULL COMMENT '预计完成时间',
  `finish_time` varchar(30) DEFAULT NULL COMMENT '完成时间',
  `pcode` varchar(40) DEFAULT '' COMMENT '父任务id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `like` int(11) DEFAULT '0' COMMENT '点赞数',
  `star` int(11) DEFAULT '0' COMMENT '收藏数',
  `reopen_num` int(11) DEFAULT '0' COMMENT '重新打开次数',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '回收站',
  `deleted_time` varchar(30) DEFAULT NULL COMMENT '删除时间',
  `private` tinyint(1) DEFAULT '0' COMMENT '是否隐私模式',
  `path` text COMMENT '上级任务路径',
  `schedule` int(11) DEFAULT '0' COMMENT '进度百分比',
  `version_code` varchar(40) DEFAULT '0' COMMENT '版本id',
  `fix_version_code` varchar(40) DEFAULT '0' COMMENT '影响的版本code',
  `plan_work_time` int(11) DEFAULT NULL COMMENT '预估工时',
  `work_time` int(11) DEFAULT '0' COMMENT '实际',
  `liked` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`project_code`) USING BTREE,
  UNIQUE KEY `task` (`code`) USING BTREE,
  KEY `stage_code` (`stage_code`) USING BTREE,
  KEY `project_code` (`project_code`) USING BTREE,
  KEY `pcode` (`pcode`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12849 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务表';

-- ----------------------------
-- Table structure for jone_task_filter
-- ----------------------------
DROP TABLE IF EXISTS `jone_task_filter`;
CREATE TABLE `jone_task_filter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(20) DEFAULT NULL COMMENT '筛选器名字',
  `member_code` varchar(40) DEFAULT NULL COMMENT '员工code',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `project_code` varchar(40) DEFAULT NULL COMMENT '项目code',
  `version_code` varchar(40) DEFAULT NULL COMMENT '版本code',
  `work_item` varchar(20) DEFAULT NULL COMMENT '工作项',
  `executor` varchar(1024) DEFAULT NULL COMMENT '执行者',
  `creator` varchar(1024) DEFAULT NULL COMMENT '创建者',
  `joiner` varchar(1024) DEFAULT NULL COMMENT '参与者',
  `done` int(4) DEFAULT NULL COMMENT '是否完成',
  `pri` varchar(20) DEFAULT NULL COMMENT '优先级',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `begin_time_start` varchar(30) DEFAULT NULL COMMENT '任务开始日期始',
  `begin_time_end` varchar(30) DEFAULT NULL COMMENT '任务开始日期终',
  `create_time_start` varchar(30) DEFAULT NULL COMMENT '创建日期开始',
  `create_time_end` varchar(30) DEFAULT NULL COMMENT '创建日期结束',
  `done_time_start` varchar(30) DEFAULT NULL COMMENT '完成日期开始',
  `done_time_end` varchar(30) DEFAULT NULL COMMENT '完成日期结束',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记',
  `plan_work_time` int(4) DEFAULT NULL COMMENT '预估工时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='任务筛选器';

-- ----------------------------
-- Table structure for jone_task_like
-- ----------------------------
DROP TABLE IF EXISTS `jone_task_like`;
CREATE TABLE `jone_task_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `task_code` varchar(40) DEFAULT '0' COMMENT '任务ID',
  `member_code` varchar(40) DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务点赞表';

-- ----------------------------
-- Table structure for jone_task_member
-- ----------------------------
DROP TABLE IF EXISTS `jone_task_member`;
CREATE TABLE `jone_task_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `task_code` varchar(40) DEFAULT '0' COMMENT '任务ID',
  `is_executor` tinyint(1) DEFAULT '0' COMMENT '执行者==经办人',
  `member_code` varchar(40) DEFAULT '' COMMENT '成员id',
  `join_time` varchar(30) DEFAULT NULL,
  `is_owner` tinyint(1) DEFAULT '0' COMMENT '是否创建人',
  `is_dutyer` tinyint(1) DEFAULT '0' COMMENT '0:非责任人 1:责任人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务-成员表';

-- ----------------------------
-- Table structure for jone_task_stages
-- ----------------------------
DROP TABLE IF EXISTS `jone_task_stages`;
CREATE TABLE `jone_task_stages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `project_code` varchar(40) DEFAULT '' COMMENT '项目id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `description` text COMMENT '备注',
  `create_time` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标记',
  `work_item` varchar(32) DEFAULT NULL COMMENT '工作项',
  `org_code` varchar(40) DEFAULT NULL COMMENT '公司code',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作项状态表';

-- ----------------------------
-- Table structure for jone_task_stages_template
-- ----------------------------
DROP TABLE IF EXISTS `jone_task_stages_template`;
CREATE TABLE `jone_task_stages_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `project_template_code` varchar(40) DEFAULT '0' COMMENT '项目id',
  `create_time` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `code` varchar(40) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='任务列表模板表';

-- ----------------------------
-- Table structure for jone_task_tag
-- ----------------------------
DROP TABLE IF EXISTS `jone_task_tag`;
CREATE TABLE `jone_task_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL,
  `project_code` varchar(40) DEFAULT NULL COMMENT '项目id',
  `name` varchar(255) DEFAULT NULL COMMENT '标签名',
  `color` enum('blue','red','orange','green','brown','purple') DEFAULT 'blue' COMMENT '颜色',
  `create_time` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='任务标签表';

-- ----------------------------
-- Table structure for jone_task_to_tag
-- ----------------------------
DROP TABLE IF EXISTS `jone_task_to_tag`;
CREATE TABLE `jone_task_to_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT NULL,
  `task_code` varchar(40) DEFAULT '0',
  `tag_code` varchar(40) DEFAULT '0',
  `create_time` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='任务标签映射表';

-- ----------------------------
-- Table structure for jone_task_work_time
-- ----------------------------
DROP TABLE IF EXISTS `jone_task_work_time`;
CREATE TABLE `jone_task_work_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `task_code` varchar(40) DEFAULT '0' COMMENT '任务ID',
  `member_code` varchar(40) DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '描述',
  `begin_time` varchar(30) DEFAULT NULL COMMENT '开始时间',
  `num` int(11) DEFAULT '0' COMMENT '工时',
  `code` varchar(40) DEFAULT NULL COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务工时表';

-- ----------------------------
-- Table structure for jone_test_report
-- ----------------------------
DROP TABLE IF EXISTS `jone_test_report`;
CREATE TABLE `jone_test_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(40) DEFAULT '' COMMENT '编号',
  `org_code` varchar(40) DEFAULT '' COMMENT '所属组织',
  `project_code` varchar(40) DEFAULT '' COMMENT '项目编号',
  `version_code` varchar(48) DEFAULT NULL COMMENT '版本编号',
  `test_people` varchar(255) DEFAULT NULL COMMENT '测试人员用‘,’分隔',
  `plan_bring_up_test_time` varchar(32) DEFAULT NULL COMMENT '预计提测时间',
  `bring_up_test_time` varchar(32) DEFAULT NULL COMMENT '提测时间-冒烟开始时间',
  `delay_test_days` int(11) DEFAULT '0' COMMENT '提测延期或提前天数(1为延期1天,-1为提前1天)',
  `delay_test_remark` varchar(255) DEFAULT NULL COMMENT '提测延期或提前备注',
  `test_start_time` varchar(32) DEFAULT NULL COMMENT '开始测试时间-冒烟结束时间',
  `test_end_time` varchar(32) DEFAULT NULL COMMENT '结束测试时间',
  `smoke_test_days` int(11) DEFAULT '0' COMMENT '冒烟天数',
  `repulse_num` int(11) DEFAULT '0' COMMENT '冒烟打回次数',
  `smoke_test_remark` varchar(255) DEFAULT NULL COMMENT '冒烟问题汇总',
  `plan_publish_time` varchar(32) DEFAULT NULL COMMENT '预计发布时间',
  `publish_time` varchar(32) DEFAULT NULL COMMENT '发布时间',
  `delay_publish_days` int(11) DEFAULT '0' COMMENT '发布延期或提前天数(1为延期1天,-1为提前1天)',
  `delay_publish_remark` varchar(255) DEFAULT NULL COMMENT '发布延期或提前备注',
  `demand_review` tinyint(4) DEFAULT NULL COMMENT '是否召开需求评审(0-否, 1-是)',
  `design_review` tinyint(4) DEFAULT NULL COMMENT '是否召开设计评审(0-否, 1-是, 2-不需要)',
  `test_case_review` tinyint(4) DEFAULT NULL COMMENT '是否召开测试用例评审(0-否, 1-是, 2-不需要)',
  `demand_change` tinyint(4) DEFAULT NULL COMMENT '是否有需求变更(0-否, 1-是)',
  `demand_change_remark` varchar(255) DEFAULT NULL COMMENT '需求变更备注',
  `test_case_execution_rate` int(11) DEFAULT '0' COMMENT '测试用例执行率',
  `test_coverage` varchar(255) DEFAULT NULL COMMENT '测试覆盖',
  `test_remark` varchar(255) DEFAULT NULL COMMENT '测试总结',
  `risk_advice` text COMMENT '风险建议',
  `p0_bug_num` int(11) DEFAULT '0' COMMENT 'p0级别bug数量',
  `p1_bug_num` int(11) DEFAULT '0' COMMENT 'p1级别bug数量',
  `p2_bug_num` int(11) DEFAULT '0' COMMENT 'p2级别bug数量',
  `p3_bug_num` int(11) DEFAULT '0' COMMENT 'p3级别bug数量',
  `refused_bug_num` int(11) DEFAULT '0' COMMENT '拒绝bug数量',
  `closed_bug_num` int(11) DEFAULT '0' COMMENT '关闭bug数量',
  `draft_status` int(11) DEFAULT '0' COMMENT '草稿状态(0-草稿,1-正式)',
  `qualified_status` int(11) DEFAULT NULL COMMENT '合格状态(0-不合格,1-合格)',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8 COMMENT='测试报告';

-- ----------------------------
-- Table structure for jone_test_report_member_bug
-- ----------------------------
DROP TABLE IF EXISTS `jone_test_report_member_bug`;
CREATE TABLE `jone_test_report_member_bug` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `test_report_code` varchar(48) DEFAULT NULL COMMENT '测试报告编号',
  `member_code` varchar(48) DEFAULT NULL COMMENT '成员编号',
  `bug_num` int(11) DEFAULT '0' COMMENT 'bug数量',
  `p0_bug_num` int(11) DEFAULT '0' COMMENT 'P0bug总数',
  `p1_bug_num` int(11) DEFAULT '0' COMMENT 'P1bug总数',
  `p2_bug_num` int(11) DEFAULT '0' COMMENT 'P2bug总数',
  `p3_bug_num` int(11) DEFAULT '0' COMMENT 'P3bug总数',
  `reopen_num` int(11) DEFAULT '0' COMMENT 'reopen bug数量',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除, -1已删除)',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8 COMMENT='测试报告成员bug统计';

-- ----------------------------
-- Table structure for jone_work_item
-- ----------------------------
DROP TABLE IF EXISTS `jone_work_item`;
CREATE TABLE `jone_work_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) DEFAULT NULL COMMENT '类型名',
  `work_item` varchar(32) DEFAULT NULL COMMENT '工作项',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '更新人code',
  `deleted` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  `org_code` varchar(40) DEFAULT NULL COMMENT '公司code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='工作项';

-- ----------------------------
-- Table structure for jone_work_item_workflow
-- ----------------------------
DROP TABLE IF EXISTS `jone_work_item_workflow`;
CREATE TABLE `jone_work_item_workflow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `workflow_code` varchar(30) DEFAULT NULL COMMENT '工作流编号',
  `name` varchar(100) DEFAULT NULL COMMENT '规则名称',
  `work_item` varchar(32) DEFAULT NULL COMMENT '工作项类型',
  `create_time` varchar(30) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  `organization_code` varchar(30) DEFAULT '' COMMENT '组织id',
  `project_code` varchar(30) DEFAULT '' COMMENT '项目id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`workflow_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='工作项工作流表';

-- ----------------------------
-- Table structure for jone_work_item_workflow_step
-- ----------------------------
DROP TABLE IF EXISTS `jone_work_item_workflow_step`;
CREATE TABLE `jone_work_item_workflow_step` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(30) DEFAULT NULL COMMENT '编号',
  `name` varchar(32) DEFAULT NULL COMMENT '步骤名',
  `work_item` varchar(32) DEFAULT '0' COMMENT '工作项类',
  `action` tinyint(1) DEFAULT '0' COMMENT '场景。0：任何条件，1：被完成，2：被重做，3：设置执行人，4：截止时间，5：优先级',
  `create_time` varchar(30) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  `workflow_code` varchar(30) DEFAULT '' COMMENT '工作流id',
  `next_workflow_code` varchar(20) DEFAULT NULL COMMENT '下一步',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='工作项工作流步骤表';

SET FOREIGN_KEY_CHECKS = 1;





-- ----------------------------
-- Records of jone_project_node
-- ----------------------------
BEGIN;
INSERT INTO `jone_project_node` VALUES (360, 'project', '项目管理模块', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (362, 'project/index', '基础版块', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (363, 'project/index/index', '框架布局', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (364, 'project/index/systemconfig', '系统信息', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (365, 'project/index/editpersonal', '修改个人资料', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (366, 'project/index/uploadavatar', '上传头像', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (370, 'project/account', '成员管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (371, 'project/account/index', '账号列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (372, 'project/organization/index', '组织列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (377, 'project/organization', '组织管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (388, 'project/auth/index', '权限列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (389, 'project/auth/add', '添加权限角色', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (390, 'project/auth/edit', '编辑权限', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (391, 'project/auth/forbid', '禁用权限', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (392, 'project/auth/resume', '启用权限', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (393, 'project/auth/del', '删除权限', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (394, 'project/auth', '访问授权', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (395, 'project/auth/apply', '应用权限', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (396, 'project/notify/index', '通知列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (397, 'project/notify/noreads', '未读通知', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (399, 'project/notify/read', '通知信息', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (401, 'project/notify/delete', '删除通知', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (402, 'project/notify', '通知管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (434, 'project/account/auth', '授权管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (435, 'project/account/add', '新建成员', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (436, 'project/account/edit', '编辑账号', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (437, 'project/account/del', '删除账号', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (438, 'project/account/forbid', '禁用账号', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (439, 'project/account/resume', '启用账号', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (498, 'project/notify/setreadied', '设置已读', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (499, 'project/notify/batchdel', '批量删除', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (500, 'project/auth/setdefault', '设置默认权限', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (501, 'project/department', '部门管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (502, 'project/department/index', '部门列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (503, 'project/department/read', '部门信息', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (504, 'project/department/save', '创建部门', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (505, 'project/department/edit', '编辑部门', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (506, 'project/department/delete', '删除部门', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (507, 'project/department_member', '部门成员管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (508, 'project/department_member/index', '部门成员列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (509, 'project/department_member/searchinvitemember', '搜索部门成员', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (510, 'project/department_member/invitemember', '添加部门成员', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (511, 'project/department_member/removemember', '移除部门成员', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (513, 'project/index/editpassword', '修改密码', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (514, 'project/index/uploadimg', '上传图片', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (515, 'project/menu', '菜单管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (516, 'project/menu/menu', '菜单列表', 0, 0, 0, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (517, 'project/menu/menuadd', '添加菜单', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (518, 'project/menu/menuedit', '编辑菜单', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (519, 'project/menu/menuforbid', '禁用菜单', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (520, 'project/menu/menuresume', '启用菜单', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (521, 'project/menu/menudel', '删除菜单', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (522, 'project/node', '节点管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (523, 'project/node/index', '节点列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (524, 'project/node/alllist', '全部节点列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (527, 'project/project', '项目管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (528, 'project/project/index', '项目列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (529, 'project/project/selflist', '个人项目列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (530, 'project/project/save', '创建项目', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (531, 'project/project/read', '项目信息', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (532, 'project/project/edit', '编辑项目', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (533, 'project/project/uploadcover', '上传项目封面', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (534, 'project/project/recycle', '项目放入回收站', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (535, 'project/project/recovery', '恢复项目', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (536, 'project/project/archive', '归档项目', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (537, 'project/project/recoveryarchive', '取消归档项目', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (538, 'project/project/quit', '退出项目', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (539, 'project/project_collect', '项目收藏管理', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (540, 'project/project_collect/collect', '收藏项目', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (541, 'project/project_member', '项目成员管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (542, 'project/project_member/index', '项目成员列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (543, 'project/project_member/searchinvitemember', '搜索项目成员', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (544, 'project/project_member/invitemember', '邀请项目成员', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (551, 'project/task/index', '任务列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (552, 'project/task/selflist', '个人任务列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (553, 'project/task/read', '任务信息', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (554, 'project/task/save', '创建任务', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (555, 'project/task/taskdone', '更改任务状态', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (556, 'project/task/assigntask', '指派任务执行者', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (558, 'project/task/createcomment', '发表任务评论', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (559, 'project/task/edit', '编辑任务', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (560, 'project/task/like', '点赞任务', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (561, 'project/task/star', '收藏任务', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (562, 'project/task/recycle', '移动任务到回收站', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (563, 'project/task/recovery', '恢复任务', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (564, 'project/task/delete', '删除任务', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (565, 'project/task', '任务管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (569, 'project/task_member/index', '任务成员列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (570, 'project/task_member/searchinvitemember', '搜索任务成员', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (571, 'project/task_member/invitemember', '添加任务成员', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (572, 'project/task_member/invitememberbatch', '批量添加任务成员', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (573, 'project/task_member', '任务成员管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (574, 'project/task_stages', '任务分组管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (575, 'project/task_stages/index', '任务分组列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (576, 'project/task_stages/tasks', '任务分组任务列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (577, 'project/task_stages/sort', '任务分组排序', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (587, 'project/project_member/removemember', '移除项目成员', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (588, 'project/task/datetotalforproject', '任务统计', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (589, 'project/task/tasksources', '任务资源列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (590, 'project/file', '文件管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (591, 'project/file/index', '文件列表', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (592, 'project/file/read', '文件详情', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (593, 'project/file/uploadfiles', '上传文件', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (594, 'project/file/edit', '编辑文件', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (595, 'project/file/recycle', '文件移至回收站', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (596, 'project/file/recovery', '恢复文件', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (597, 'project/file/delete', '删除文件', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (598, 'project/project/getlogbyselfproject', '项目概况', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (599, 'project/source_link', '资源关联管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (600, 'project/source_link/delete', '取消关联', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (601, 'project/task/tasklog', '任务动态', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (602, 'project/task/recyclebatch', '批量移动任务到回收站', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (603, 'project/invite_link', '邀请链接管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (604, 'project/invite_link/save', '创建邀请链接', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (605, 'project/task/setprivate', '设置任务隐私模式', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (606, 'project/account/read', '账号信息', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (607, 'project/task/batchassigntask', '批量指派任务', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (608, 'project/task/tasktotags', '任务标签', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (609, 'project/task/settag', '设置任务标签', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (610, 'project/task_tag', '任务标签管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (611, 'project/task_tag/index', '任务标签列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (612, 'project/task_tag/save', '创建任务标签', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (613, 'project/task_tag/edit', '编辑任务标签', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (614, 'project/task_tag/delete', '删除任务标签', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (615, 'project/project_features', '项目版本库管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (616, 'project/project_features/index', '版本库列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (620, 'project/version', '项目版本管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (622, 'project/version/save', '添加项目版本', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (623, 'project/version/edit', '编辑项目版本', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (625, 'project/version/read', '项目版本详情', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (627, 'project/version/removeversiontask', '移除项目版本任务', 0, 1, 1, NULL);
INSERT INTO `jone_project_node` VALUES (628, 'project/version/delete', '删除项目版本', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (629, 'project/task/getlistbytasktag', '标签任务列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (635, 'project/department_member/detail', '部门成员详情', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (636, 'project/department_member/uploadfile', '上传头像', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (637, 'project/task/savetaskworktime', '保存任务工时', 0, 1, 1, NULL);
INSERT INTO `jone_project_node` VALUES (638, 'project/task/edittaskworktime', '编辑任务工时', 0, 1, 1, NULL);
INSERT INTO `jone_project_node` VALUES (639, 'project/task/deltaskworktime', '删除任务工时', 0, 1, 1, NULL);
INSERT INTO `jone_project_node` VALUES (640, 'project/task/uploadfile', '上传文件', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (642, 'project/login/_bindmobile', '绑定号码', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (643, 'project/login/_bindmail', '绑定邮箱', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (644, 'project/task/_taskworktimelist', '任务工时', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (645, 'project/project_member/_listforinvite', '邀请新成员', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (646, 'project/project_info', '项目信息', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (647, 'project/project/_getprojectreport', '项目报告', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (648, 'project/project/_projectstats', '项目统计资料', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (649, 'project/workbench/todotimeouttotal', '违反任务操作规则统计数量', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (650, 'project/workbench', '工作台', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (651, 'project/workbench/selecttasktimeoutupdate', '任务超时提醒', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (652, 'project/organization/_getorglist', '获取当前组织', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (653, 'project/workbench/selectteamtasktimeoutupdate', '团队任务超时提醒', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (654, 'project/workbench/todoteamtimeouttotal', '团队超时未操作统计数量', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (655, 'project/config/updatecompanyname', '修改公司名字', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (656, 'project/config/getcompanyinfo', '获取公司信息', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (657, 'project/config', '公司配置', 0, 0, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (658, 'project/version/getprojectversion', '获取项目版本', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (659, 'project/version/getprojectversionlist', '获取项目版本List', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (665, 'project/version/_getversionlog', '获取版本日志', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (666, 'project/version/_getversiontask', '获取版本任务', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (667, 'project/task/gettaskfilterlist', '任务过滤器列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (668, 'project/task/savetaskfilter', '保存任务过滤器', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (669, 'project/task/deltaskfilter', '删除过滤器', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (670, 'project/taskstages', '任务列表管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (671, 'project/taskstages/gettasklist', '获取任务列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (672, 'project/taskstages/gettaskstagelist', '获取任务泳道', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (673, 'project/config/getnonassessor', '获取非考核人员列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (674, 'project/config/updatenonassessor', '修改非考核人员列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (675, 'score', '积分', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (676, 'score/config', '积分设置', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (677, 'score/rule', '积分规则设置', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (678, 'score/config/saveorupdate', '新增或编辑基本配置', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (679, 'score/config/detail', '查询基本配置', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (680, 'score/config/current', '当前生效的周期', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (681, 'score/config/loglist', '当前组织所有周期', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (682, 'score/rule/list', '获取规则列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (683, 'score/rule/changeenable', '禁用启用规则', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (684, 'score/rule/batchupdate', '批量修改规则', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (685, 'score/report', '报表管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (686, 'score/report/memberworkhourlist', '工时报表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (687, 'score/report/versionprogresslist', '版本报表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (688, 'score/report/memberscorelist', '积分报表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (689, 'score/report/recordlist', '积分明细报表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (690, 'score/report/memberlist', '成员下拉列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (691, 'score/report/memberscorereport', '成员积分对比报表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (692, 'score/testreport', '测试报告管理', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (693, 'score/testreport/init', '初始化测试报告', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (694, 'score/testreport/detail', '查询测试报告详情', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (695, 'score/testreport/update', '编辑测试报告', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (696, 'score/testreport/publish', '发布测试报告', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (697, 'score/testreport/parenttasklist', '查询版本发布内容', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (698, 'score/testreport/parenttaskexprot', '导出pdf测试报表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (699, 'score/testreport/parenttaskuploadtestreport', '上传测试报告图表图片', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (700, 'score/report/excutelog', '执行记录列表', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (701, 'project/account/exporttemplate', '导出成员模板', 0, 1, 1, '2020-10-10 17:35:32');
INSERT INTO `jone_project_node` VALUES (702, 'project/account/import', '成员批量导入', 0, 1, 1, '2020-10-10 17:35:32');
COMMIT;


BEGIN;
INSERT INTO `jone_holiday` VALUES (272, '2020-01-01', '元旦', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (273, '2020-01-04', '周六', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (274, '2020-01-05', '周日', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (275, '2020-01-11', '周六', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (276, '2020-01-12', '周日', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (277, '2020-01-18', '周六', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (278, '2020-01-24', '春节', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (279, '2020-01-25', '春节', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (280, '2020-01-26', '春节', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (281, '2020-01-27', '春节', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (282, '2020-01-28', '春节', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (283, '2020-01-29', '春节', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (284, '2020-01-30', '春节', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (285, '2020-02-02', '周日', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (286, '2020-02-08', '周六', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (287, '2020-02-09', '周日', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (288, '2020-02-15', '周六', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (289, '2020-02-16', '周日', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (290, '2020-02-22', '周六', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (291, '2020-02-23', '周日', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (292, '2020-02-29', '周六', 0, '2020-09-10 10:04:48', '2020-09-10 10:04:48', NULL);
INSERT INTO `jone_holiday` VALUES (293, '2020-03-01', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (294, '2020-03-07', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (295, '2020-03-08', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (296, '2020-03-14', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (297, '2020-03-15', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (298, '2020-03-21', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (299, '2020-03-22', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (300, '2020-03-28', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (301, '2020-03-29', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (302, '2020-04-04', '清明', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (303, '2020-04-05', '清明', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (304, '2020-04-06', '清明', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (305, '2020-04-11', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (306, '2020-04-12', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (307, '2020-04-18', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (308, '2020-04-19', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (309, '2020-04-25', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (310, '2020-05-01', '劳动节', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (311, '2020-05-02', '劳动节', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (312, '2020-05-03', '劳动节', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (313, '2020-05-04', '劳动节', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (314, '2020-05-05', '劳动节', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (315, '2020-05-10', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (316, '2020-05-16', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (317, '2020-05-17', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (318, '2020-05-23', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (319, '2020-05-24', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (320, '2020-05-30', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (321, '2020-05-31', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (322, '2020-06-06', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (323, '2020-06-07', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (324, '2020-06-13', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (325, '2020-06-14', '周日', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (326, '2020-06-20', '周六', 0, '2020-09-10 10:04:49', '2020-09-10 10:04:49', NULL);
INSERT INTO `jone_holiday` VALUES (327, '2020-06-21', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (328, '2020-06-25', '端午', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (329, '2020-06-26', '端午', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (330, '2020-06-27', '端午', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (331, '2020-07-04', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (332, '2020-07-05', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (333, '2020-07-11', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (334, '2020-07-12', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (335, '2020-07-18', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (336, '2020-07-19', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (337, '2020-07-25', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (338, '2020-07-26', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (339, '2020-08-01', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (340, '2020-08-02', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (341, '2020-08-08', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (342, '2020-08-09', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (343, '2020-08-15', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (344, '2020-08-16', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (345, '2020-08-22', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (346, '2020-08-23', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (347, '2020-08-29', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (348, '2020-08-30', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (349, '2020-09-05', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (350, '2020-09-06', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (351, '2020-09-12', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (352, '2020-09-13', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (353, '2020-09-19', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (354, '2020-09-20', '周日', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (355, '2020-09-26', '周六', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (356, '2020-10-01', '国庆', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (357, '2020-10-02', '国庆', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (358, '2020-10-03', '国庆', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (359, '2020-10-04', '国庆', 0, '2020-09-10 10:04:50', '2020-09-10 10:04:50', NULL);
INSERT INTO `jone_holiday` VALUES (360, '2020-10-05', '国庆', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (361, '2020-10-06', '国庆', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (362, '2020-10-07', '国庆', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (363, '2020-10-08', '国庆', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (364, '2020-10-11', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (365, '2020-10-17', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (366, '2020-10-18', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (367, '2020-10-24', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (368, '2020-10-25', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (369, '2020-10-31', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (370, '2020-11-01', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (371, '2020-11-07', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (372, '2020-11-08', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (373, '2020-11-14', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (374, '2020-11-15', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (375, '2020-11-21', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (376, '2020-11-22', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (377, '2020-11-28', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (378, '2020-11-29', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (379, '2020-12-05', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (380, '2020-12-06', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (381, '2020-12-12', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (382, '2020-12-13', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (383, '2020-12-19', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (384, '2020-12-20', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (385, '2020-12-26', '周六', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
INSERT INTO `jone_holiday` VALUES (386, '2020-12-27', '周日', 0, '2020-09-10 10:04:51', '2020-09-10 10:04:51', NULL);
COMMIT;


BEGIN;
INSERT INTO `jone_project_menu` VALUES (120, 0, '工作台', 'appstore-o', 'home', 'home', ':org', '#', 0, 1, 0, '2018-09-30 16:30:01', 0, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (121, 0, '项目管理', 'project', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (122, 121, '项目列表', 'branches', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (124, 0, '系统设置', 'setting', '#', '#', '', '#', 100, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (125, 124, '授权管理', 'unlock', '#', '#', '', '#', 10, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (126, 125, '账号列表', '', 'system/account', 'system/account', '', 'project/account/index', 10, 0, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (127, 122, '我的组织', '', 'organization', 'organization', '', 'project/organization/index', 30, 0, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (130, 125, '访问授权', '', 'system/account/auth', 'system/account/auth', '', 'project/auth/index', 20, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (131, 125, '授权页面', '', 'system/account/apply', 'system/account/apply', ':id', 'project/auth/apply', 30, 1, 0, '0000-00-00 00:00:00', 1, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (138, 121, '消息提醒', 'info-circle-o', '#', '#', '', '#', 30, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (139, 138, '站内消息', '', 'notify/notice', 'notify/notice', '', 'project/notify/index', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (140, 138, '系统公告', '', 'notify/system', 'notify/system', '', 'project/notify/index', 10, 0, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (143, 124, '系统管理', 'appstore', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (144, 143, '菜单路由', '', 'system/config/menu', 'system/config/menu', '', 'project/menu/menuadd', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (145, 143, '访问节点', '', 'system/config/node', 'system/config/node', '', 'project/node/save', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (148, 124, '个人管理', 'user', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (149, 148, '个人设置', '', 'account/setting/base', 'account/setting/base', '', 'project/index/editpersonal', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (150, 148, '安全设置', '', 'account/setting/security', 'account/setting/security', '', 'project/index/editpersonal', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (151, 122, '我的项目', '', 'project/list', 'project/list', ':type', 'project/project/index', 0, 1, 0, '0000-00-00 00:00:00', 0, 'my', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (152, 122, '回收站', '', 'project/recycle', 'project/recycle', '', 'project/project/index', 20, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (153, 121, '项目空间', 'heat-map', 'project/space/task', 'project/space/task', ':code', '#', 20, 1, 0, '0000-00-00 00:00:00', 1, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (154, 153, '任务详情', '', 'project/space/task/:code/detail', 'project/space/taskdetail', ':code', 'project/task/read', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (155, 122, '我的收藏', '', 'project/list', 'project/list', ':type', 'project/project/index', 10, 1, 0, '0000-00-00 00:00:00', 0, 'collect', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (156, 121, '基础设置', 'experiment', '#', '#', '', '#', 0, 0, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (157, 156, '项目模板', '', 'project/template', 'project/template', '', 'project/project_template/index', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (158, 156, '项目列表模板', '', 'project/template/taskStages', 'project/template/taskStages', ':code', 'project/task_stages_template/index', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (159, 122, '已归档项目', '', 'project/archive', 'project/archive', '', 'project/project/index', 10, 1, 0, NULL, 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (160, 0, '成员管理', 'team', '#', '#', '', '#', 0, 1, 0, NULL, 0, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (161, 153, '项目概况', '', 'project/space/overview', 'project/space/overview', ':code', 'project/index/info', 20, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (162, 153, '项目文件', '', 'project/space/files', 'project/space/files', ':code', 'project/index/info', 10, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (163, 122, '项目分析', '', 'project/analysis', 'project/analysis', '', 'project/index/info', 5, 0, 0, NULL, 0, '', 1, NULL);
INSERT INTO `jone_project_menu` VALUES (164, 160, '团队成员', '', '#', '#', '', '#', 0, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (166, 164, '团队成员', '', 'members', 'members', '', 'project/department/index', 0, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (167, 164, '成员信息', '', 'members/profile', 'members/profile', ':code', 'project/department/read', 0, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (168, 153, '版本管理', '', 'project/space/features', 'project/space/features', ':code', 'project/index/info', 20, 1, 0, NULL, 1, '', 0, NULL);
INSERT INTO `jone_project_menu` VALUES (176, 0, '积分体系', 'fire', '#', '#', '', '#', 90, 1, 0, '2020-09-04 10:50:14', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (177, 0, '报表分析', 'table', '#', '', '', 'project/config/updatecompanyname', 95, 1, 0, '2020-09-04 10:52:43', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (180, 153, '任务列表', '', 'project/space/list', 'project/space/list', ':code', 'project', 0, 1, 0, '2020-09-09 11:25:00', 1, NULL, 0, '');
INSERT INTO `jone_project_menu` VALUES (184, 176, '积分体系', 'fire', '#', '#', '', '#', 0, 1, 0, '2020-09-14 18:37:49', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (185, 184, '积分设置', '', 'scores/settings', 'scores/settings', '', '#', 0, 1, 0, '2020-09-14 18:38:11', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (186, 184, '积分规则设置', '', 'scores/rules', 'scores/rules', '', '#', 0, 1, 0, '2020-09-14 18:38:32', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (187, 177, '报表管理', 'fire', '#', '#', '', '#', 0, 1, 0, '2020-09-14 19:10:15', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (188, 187, '积分', '', 'reports/score', 'reports/score', '', '#', 0, 1, 0, '2020-09-14 19:11:30', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (189, 187, '工时', '', 'reports/hours', 'reports/hours', '', '#', 0, 1, 0, '2020-09-14 20:52:25', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (190, 187, '迭代进度', '', 'reports/progress', 'reports/progress', '', '#', 0, 0, 0, '2020-09-14 20:55:49', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (191, 187, '人力进度', '', 'reports/manpower', 'reports/manpower', '', '#', 0, 0, 0, '2020-09-14 20:58:48', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (192, 187, '项目进度', '', 'reports/project', 'reports/project', '', '#', 0, 0, 0, '2020-09-14 20:59:36', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (194, 121, '测试报告', '', 'project/report', 'project/space/report', ':versionCode', '#', 0, 1, 0, '2020-09-16 11:20:54', 0, NULL, 0, '');
INSERT INTO `jone_project_menu` VALUES (196, 187, '积分明细', '', 'reports/details', 'reports/details', '', '#', 0, 1, 0, '2020-10-02 10:33:08', 0, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (198, 187, '对比', '', 'reports/contrast', 'reports/contrast', '', '#', 0, 1, 0, '2020-10-06 18:48:06', 1, NULL, 1, '');
INSERT INTO `jone_project_menu` VALUES (203, 143, '系统设置', '', 'system/config/settings', 'system/config/settings', '', '#', 0, 1, 0, '2020-10-09 18:23:53', 0, NULL, 1, '');
COMMIT;


-- ----------------------------
-- Records of jone_system_config
-- ----------------------------
BEGIN;
INSERT INTO `jone_system_config` VALUES (1, 'app_name', '杭州健信科技有限公司');
INSERT INTO `jone_system_config` VALUES (2, 'site_name', 'JOne');
INSERT INTO `jone_system_config` VALUES (3, 'app_version', '1.0');
INSERT INTO `jone_system_config` VALUES (4, 'site_copy', 'Copyright © 2019 健信科技');
INSERT INTO `jone_system_config` VALUES (5, 'browser_icon', '');
INSERT INTO `jone_system_config` VALUES (6, 'tongji_baidu_key', '');
INSERT INTO `jone_system_config` VALUES (7, 'miitbeian', '');
INSERT INTO `jone_system_config` VALUES (8, 'storage_type', 'local');
INSERT INTO `jone_system_config` VALUES (9, 'storage_local_exts', 'png,jpg,rar,doc,icon,mp4,zip,gif,jpeg,bmp,webp,mp4,m3u8,rmvb,avi,swf,3gp,mkv,flv,txt,docx,pages,epub,pdf,numbers,csv,xls,xlsx,keynote,ppt,pptx,mp3,wav,wma,ogg,aac,flac;');
INSERT INTO `jone_system_config` VALUES (10, 'storage_qiniu_bucket', 'static');
INSERT INTO `jone_system_config` VALUES (11, 'storage_qiniu_domain', 'example.xyz');
INSERT INTO `jone_system_config` VALUES (12, 'storage_qiniu_access_key', 'example');
INSERT INTO `jone_system_config` VALUES (13, 'storage_qiniu_secret_key', 'example');
INSERT INTO `jone_system_config` VALUES (14, 'storage_oss_bucket', 'vilson-static');
INSERT INTO `jone_system_config` VALUES (15, 'storage_oss_endpoint', 'oss-cn-shenzhen.aliyuncs.com');
INSERT INTO `jone_system_config` VALUES (16, 'storage_oss_domain', 'example.xyz');
INSERT INTO `jone_system_config` VALUES (17, 'storage_oss_keyid', 'example');
INSERT INTO `jone_system_config` VALUES (18, 'storage_oss_secret', 'example');
INSERT INTO `jone_system_config` VALUES (34, 'wechat_appid', '');
INSERT INTO `jone_system_config` VALUES (35, 'wechat_appkey', '');
INSERT INTO `jone_system_config` VALUES (36, 'storage_oss_is_https', 'https');
INSERT INTO `jone_system_config` VALUES (37, 'wechat_type', 'thr');
INSERT INTO `jone_system_config` VALUES (38, 'wechat_token', 'test');
INSERT INTO `jone_system_config` VALUES (39, 'wechat_appsecret', '');
INSERT INTO `jone_system_config` VALUES (40, 'wechat_encodingaeskey', '');
INSERT INTO `jone_system_config` VALUES (41, 'wechat_thr_appid', '');
INSERT INTO `jone_system_config` VALUES (42, 'wechat_thr_appkey', '');
INSERT INTO `jone_system_config` VALUES (43, 'storage_qiniu_is_https', 'https');
INSERT INTO `jone_system_config` VALUES (44, 'single_mode', '0');
INSERT INTO `jone_system_config` VALUES (45, 'single_org_code', '');
INSERT INTO `jone_system_config` VALUES (46, 'app_desc', '研发体系管家');
INSERT INTO `jone_system_config` VALUES (47, 'app_title', 'JONE');
INSERT INTO `jone_system_config` VALUES (48, 'install_flag', '0');
COMMIT;


-- ----------------------------
-- Records of jone_score_rule_info
-- ----------------------------
BEGIN;
INSERT INTO `jone_score_rule_info` VALUES (0, '6v7be19pwman2fird04gqu53', NULL, 'TEAM_COLLABORATION_000', '违反日常操作规范', NULL, NULL, -1, 1, 'TEAM_COLLABORATION', NULL, NULL, 0, '2020-09-22 09:39:41', '2020-09-28 11:13:39', NULL);
INSERT INTO `jone_score_rule_info` VALUES (1, '6v7be19pwman2fird04gqu53', 'TEAM_COLLABORATION_000', 'TEAM_COLLABORATION_001', '停留在新建状态超过{config1}个小时（当天{config2}以后新建的任务不统计在内）', NULL, NULL, NULL, 1, 'TEAM_COLLABORATION', 4, '16:00', 0, '2020-09-08 16:53:21', '2020-09-25 11:17:40', NULL);
INSERT INTO `jone_score_rule_info` VALUES (2, '6v7be19pwman2fird04gqu53', 'TEAM_COLLABORATION_000', 'TEAM_COLLABORATION_002', '超过计划完成时间未进行任何处理', NULL, NULL, NULL, 1, 'TEAM_COLLABORATION', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-23 22:33:14', -1);
INSERT INTO `jone_score_rule_info` VALUES (3, '6v7be19pwman2fird04gqu53', 'TEAM_COLLABORATION_000', 'TEAM_COLLABORATION_003', '进行中的单个任务时间超过8小时的，当天未更新进度', NULL, NULL, NULL, 1, 'TEAM_COLLABORATION', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-22 09:44:11', -1);
INSERT INTO `jone_score_rule_info` VALUES (4, '6v7be19pwman2fird04gqu53', 'TEAM_COLLABORATION_000', 'TEAM_COLLABORATION_004', '开始时间在今天之前（包括今天）的任务，状态没有更新', NULL, NULL, NULL, 1, 'TEAM_COLLABORATION', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-22 09:44:10', -1);
INSERT INTO `jone_score_rule_info` VALUES (5, '6v7be19pwman2fird04gqu53', 'TEAM_COLLABORATION_000', 'TEAM_COLLABORATION_005', '任务变更操作未添加备注', NULL, NULL, NULL, 1, 'TEAM_COLLABORATION', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-25 16:22:26', -1);
INSERT INTO `jone_score_rule_info` VALUES (6, '6v7be19pwman2fird04gqu53', NULL, 'TEAM_COLLABORATION_006', '连续一个月没有扣分', NULL, NULL, 3, 1, 'TEAM_COLLABORATION', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:12:55', NULL);
INSERT INTO `jone_score_rule_info` VALUES (7, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_001', '按要求组织召开需求评审、测试评审、设计评审之后，仍旧有需求变更、设计变更', -2, NULL, NULL, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:06:59', -1);
INSERT INTO `jone_score_rule_info` VALUES (8, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_002', '需求/项目未按要求组织相关评审（每缺少一项，需求/项目评审时有明确流程裁剪的例外）', -1, NULL, NULL, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:08:55', -1);
INSERT INTO `jone_score_rule_info` VALUES (9, '6v7be19pwman2fird04gqu53', '', 'TEAM_COLLABORATION_007', '没能按时间规划完成任务（每延迟一天）', NULL, NULL, -1, 1, 'TEAM_COLLABORATION', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:07:25', -1);
INSERT INTO `jone_score_rule_info` VALUES (10, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_004', '项目没能按时提测（每延迟一天）', -1, -1, NULL, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:07:38', -1);
INSERT INTO `jone_score_rule_info` VALUES (11, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_005', '冒烟测试打回（每打回一次）', -2, -2, -5, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:09:30', -1);
INSERT INTO `jone_score_rule_info` VALUES (12, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_006', '项目结束后，开发责任人名下的reopen累计次数超过{config1}次（从第{config1}次起，每增加1次积分{taskHead}）', NULL, NULL, -1, 1, 'QUALITY_EFFICIENCY', 3, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:10:49', NULL);
INSERT INTO `jone_score_rule_info` VALUES (13, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_007', 'A类项目按时提测', 1, 1, 1, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:04:14', -1);
INSERT INTO `jone_score_rule_info` VALUES (14, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_008', 'B类项目按时提测', 2, 2, 2, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:04:22', -1);
INSERT INTO `jone_score_rule_info` VALUES (15, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_009', 'C类项目按时提测', 3, 3, 3, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:04:30', -1);
INSERT INTO `jone_score_rule_info` VALUES (16, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_010', 'A类项目冒烟一次性通过', 2, 2, 2, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:04:43', -1);
INSERT INTO `jone_score_rule_info` VALUES (17, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_011', 'B类项目冒烟一次性通过', 4, 4, 4, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:05:04', -1);
INSERT INTO `jone_score_rule_info` VALUES (18, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_012', 'C类项目冒烟一次性通过', 6, 6, 6, 1, 'QUALITY_EFFICIENCY', NULL, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:04:55', -1);
INSERT INTO `jone_score_rule_info` VALUES (19, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_013', 'A类项目P0/P1级别以上的Bug总数低于{config1}个', 2, 2, 2, 1, 'QUALITY_EFFICIENCY', 5, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:05:12', -1);
INSERT INTO `jone_score_rule_info` VALUES (20, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_014', 'B类项目P0/P1级别以上的Bug总数低于{config1}个', 4, 4, 4, 1, 'QUALITY_EFFICIENCY', 8, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:05:34', -1);
INSERT INTO `jone_score_rule_info` VALUES (21, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_015', 'C类项目P0/P1级别以上的Bug总数低于{config1}个', 6, 6, 6, 1, 'QUALITY_EFFICIENCY', 10, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:06:28', NULL);
INSERT INTO `jone_score_rule_info` VALUES (22, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_016', 'A类项目同时满足按时提测、冒烟一次性通过、P0/P1级别Bug低于{config1}个', 5, 5, 5, 1, 'QUALITY_EFFICIENCY', 5, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:06:31', -1);
INSERT INTO `jone_score_rule_info` VALUES (23, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_017', 'B类项目同时满足按时提测、冒烟一次性通过、P0/P1级别Bug低于{config1}个', 8, 8, 8, 1, 'QUALITY_EFFICIENCY', 8, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:06:34', -1);
INSERT INTO `jone_score_rule_info` VALUES (24, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_018', 'C类项目同时满足按时提测、冒烟一次性通过、P0/P1级别Bug低于{config1}个', 10, 10, 10, 1, 'QUALITY_EFFICIENCY', 10, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:06:37', -1);
INSERT INTO `jone_score_rule_info` VALUES (25, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_019', 'A类项目Bug最少的{config1}%开发责任人', NULL, NULL, 2, 1, 'QUALITY_EFFICIENCY', 30, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:06:40', -1);
INSERT INTO `jone_score_rule_info` VALUES (26, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_020', 'B类项目Bug最少的{config1}%开发责任人', NULL, NULL, 5, 1, 'QUALITY_EFFICIENCY', 30, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:06:43', -1);
INSERT INTO `jone_score_rule_info` VALUES (27, '6v7be19pwman2fird04gqu53', NULL, 'QUALITY_EFFICIENCY_021', 'C类项目Bug最少的{config1}%开发责任人', NULL, NULL, 8, 1, 'QUALITY_EFFICIENCY', 30, NULL, 0, '2020-09-08 16:53:21', '2020-09-28 11:06:46', NULL);
COMMIT;

-- ----------------------------
-- Records of jone_work_item_workflow_step
-- ----------------------------测试完成
BEGIN;
INSERT INTO `jone_work_item_workflow_step` VALUES (3, '0', '新建', 'demand', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j5z', '1');
INSERT INTO `jone_work_item_workflow_step` VALUES (4, '1', '已接受', 'demand', 3, NULL, NULL, 'sbklfvyouc0qpmwhitn47j5z', '2,7');
INSERT INTO `jone_work_item_workflow_step` VALUES (5, '2', '处理中', 'demand', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j5z', '3,7');
INSERT INTO `jone_work_item_workflow_step` VALUES (6, '3', '已解决', 'demand', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j5z', '8');
INSERT INTO `jone_work_item_workflow_step` VALUES (7, '7', '挂起', 'demand', 3, NULL, NULL, 'sbklfvyouc0qpmwhitn47j5z', '1');
INSERT INTO `jone_work_item_workflow_step` VALUES (8, '8', '已关闭', 'demand', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j5z', NULL);
INSERT INTO `jone_work_item_workflow_step` VALUES (9, '0', '新建', 'task', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j51', '1');
INSERT INTO `jone_work_item_workflow_step` VALUES (10, '1', '已接受', 'task', 1, NULL, NULL, 'sbklfvyouc0qpmwhitn47j51', '2,7');
INSERT INTO `jone_work_item_workflow_step` VALUES (11, '2', '处理中', 'task', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j51', '3,7');
INSERT INTO `jone_work_item_workflow_step` VALUES (12, '3', '已解决', 'task', 1, NULL, NULL, 'sbklfvyouc0qpmwhitn47j51', '8');
INSERT INTO `jone_work_item_workflow_step` VALUES (13, '7', '挂起', 'task', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j51', '1');
INSERT INTO `jone_work_item_workflow_step` VALUES (14, '8', '已关闭', 'task', 3, NULL, NULL, 'sbklfvyouc0qpmwhitn47j51', NULL);
INSERT INTO `jone_work_item_workflow_step` VALUES (15, '0', '新建', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', '1');
INSERT INTO `jone_work_item_workflow_step` VALUES (16, '1', '已接受', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', '2,7');
INSERT INTO `jone_work_item_workflow_step` VALUES (17, '2', '处理中', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', '3,7');
INSERT INTO `jone_work_item_workflow_step` VALUES (18, '3', '已解决', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', '4,5');
INSERT INTO `jone_work_item_workflow_step` VALUES (19, '4', '已验证', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', '8');
INSERT INTO `jone_work_item_workflow_step` VALUES (20, '5', '重新打开', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', '1');
INSERT INTO `jone_work_item_workflow_step` VALUES (21, '8', '已关闭', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', NULL);
INSERT INTO `jone_work_item_workflow_step` VALUES (22, '7', '挂起', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', '1');
INSERT INTO `jone_work_item_workflow_step` VALUES (23, '6', '拒绝', 'bug', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j52', NULL);
INSERT INTO `jone_work_item_workflow_step` VALUES (24, '100', '规划中', 'version', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j53', '101');
INSERT INTO `jone_work_item_workflow_step` VALUES (25, '101', '研发中', 'version', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j53', '102');
INSERT INTO `jone_work_item_workflow_step` VALUES (26, '102', '冒烟测试中', 'version', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j53', '101,103');
INSERT INTO `jone_work_item_workflow_step` VALUES (27, '103', '测试中', 'version', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j53', '104');
INSERT INTO `jone_work_item_workflow_step` VALUES (28, '104', '测试完成', 'version', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j53', '105');
INSERT INTO `jone_work_item_workflow_step` VALUES (29, '105', '已发布', 'version', 0, NULL, NULL, 'sbklfvyouc0qpmwhitn47j53', NULL);
COMMIT;


-- ----------------------------
-- Records of jone_task_stages
-- ----------------------------
BEGIN;
INSERT INTO `jone_task_stages` VALUES (262, '新建', '', 262, NULL, '2020-09-07 11:17:31', '0', 0, 'demand', NULL);
INSERT INTO `jone_task_stages` VALUES (263, '已接受', '', 263, NULL, '2020-09-07 11:17:42', '1', 0, 'demand', NULL);
INSERT INTO `jone_task_stages` VALUES (264, '处理中', '', 264, NULL, '2020-09-07 11:17:55', '2', 0, 'demand', NULL);
INSERT INTO `jone_task_stages` VALUES (265, '已解决', '', 265, NULL, '2020-09-07 11:18:04', '3', 0, 'demand', NULL);
INSERT INTO `jone_task_stages` VALUES (266, '挂起', '', 266, NULL, '2020-09-07 11:18:25', '7', 0, 'demand', NULL);
INSERT INTO `jone_task_stages` VALUES (267, '已关闭', '', 267, NULL, '2020-09-07 11:18:30', '8', 0, 'demand', NULL);
INSERT INTO `jone_task_stages` VALUES (268, '新建', '', 268, NULL, '2020-09-07 11:19:26', '0', 0, 'task', NULL);
INSERT INTO `jone_task_stages` VALUES (269, '已接受', '', 269, NULL, '2020-09-07 11:19:32', '1', 0, 'task', NULL);
INSERT INTO `jone_task_stages` VALUES (270, '处理中', '', 270, NULL, '2020-09-07 11:19:39', '2', 0, 'task', NULL);
INSERT INTO `jone_task_stages` VALUES (271, '已解决', '', 271, NULL, '2020-09-07 11:19:44', '3', 0, 'task', NULL);
INSERT INTO `jone_task_stages` VALUES (272, '挂起', '', 272, NULL, '2020-09-07 11:19:50', '7', 0, 'task', NULL);
INSERT INTO `jone_task_stages` VALUES (273, '已关闭', '', 273, NULL, '2020-09-07 11:19:54', '8', 0, 'task', NULL);
INSERT INTO `jone_task_stages` VALUES (274, '新建', '', 274, NULL, '2020-09-07 11:20:41', '0', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (275, '已接受', '', 275, NULL, '2020-09-07 11:20:46', '1', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (276, '处理中', '', 276, NULL, '2020-09-07 11:20:52', '2', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (277, '已解决', '', 277, NULL, '2020-09-07 11:20:59', '3', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (278, '已验证', '', 278, NULL, '2020-09-07 11:21:03', '4', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (279, '重新打开', '', 279, NULL, '2020-09-07 11:21:15', '5', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (280, '已关闭', '', 280, NULL, '2020-09-07 11:21:34', '8', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (281, '挂起', '', 281, NULL, '2020-09-07 11:21:39', '7', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (282, '拒绝', '', 282, NULL, '2020-09-07 11:21:44', '6', 0, 'bug', NULL);
INSERT INTO `jone_task_stages` VALUES (288, '规划中', '', 0, NULL, '2020-09-07 11:21:44', '100', 0, 'version', NULL);
INSERT INTO `jone_task_stages` VALUES (289, '研发中', '', 0, NULL, '2020-09-07 11:21:44', '101', 0, 'version', NULL);
INSERT INTO `jone_task_stages` VALUES (290, '冒烟测试中', '', 0, NULL, '2020-09-07 11:21:44', '102', 0, 'version', NULL);
INSERT INTO `jone_task_stages` VALUES (291, '测试中', '', 0, NULL, '2020-09-07 11:21:44', '103', 0, 'version', NULL);
INSERT INTO `jone_task_stages` VALUES (292, '测试完成', '', 0, NULL, '2020-09-07 11:21:44', '104', 0, 'version', NULL);
INSERT INTO `jone_task_stages` VALUES (293, '已发布', '', 0, NULL, '2020-09-07 11:21:44', '105', 0, 'version', NULL);
COMMIT;


-- ----------------------------
-- Records of jone_work_item
-- ----------------------------
BEGIN;
INSERT INTO `jone_work_item` VALUES (1, '需求', 'demand', '2020-09-01 10:06:30', '2020-09-01 10:06:30', NULL, 0, '6v7be19pwman2fird04gqu53');
INSERT INTO `jone_work_item` VALUES (2, '任务', 'task', '2020-09-01 10:06:30', '2020-09-01 10:06:30', NULL, 0, '6v7be19pwman2fird04gqu53');
INSERT INTO `jone_work_item` VALUES (3, '故障', 'bug', '2020-09-01 10:06:30', '2020-09-01 10:06:30', NULL, 0, '6v7be19pwman2fird04gqu53');
INSERT INTO `jone_work_item` VALUES (4, '版本', 'version', '2020-09-01 10:06:30', '2020-09-01 10:06:30', NULL, 0, '6v7be19pwman2fird04gqu53');
COMMIT;


-- ----------------------------
-- Records of jone_work_item_workflow
-- ----------------------------
BEGIN;
INSERT INTO `jone_work_item_workflow` VALUES (3, 'sbklfvyouc0qpmwhitn47j5z', '需求', 'demand', NULL, NULL, '6v7be19pwman2fird04gqu53', '');
INSERT INTO `jone_work_item_workflow` VALUES (4, 'sbklfvyouc0qpmwhitn47j51', '任务', 'task', NULL, NULL, '6v7be19pwman2fird04gqu53', '');
INSERT INTO `jone_work_item_workflow` VALUES (5, 'sbklfvyouc0qpmwhitn47j52', '故障', 'bug', NULL, NULL, '6v7be19pwman2fird04gqu53', '');
INSERT INTO `jone_work_item_workflow` VALUES (7, 'sbklfvyouc0qpmwhitn47j53', '版本', 'version', NULL, NULL, '6v7be19pwman2fird04gqu53', '');
COMMIT;

-- ----------------------------
-- Records of jone_score_org_config
-- ----------------------------
BEGIN;
INSERT INTO `jone_score_org_config` VALUES (1, '6v7be19pwman2fird04gqu53', 2, '2020-09-25 20:00:00', 0, '2020-09-14 17:43:19', '2020-09-29 11:49:15', NULL);
COMMIT;
