INSERT INTO `dict` (`id`, `name`, `value`, `wordGroup`) VALUES
(15, 'freeAccessFunctionId', '27', 'system'),
(16, 'tryUserRoleId', '9', 'system');

INSERT INTO `request` (`id`, `url`, `functionId`, `isPage`, `breadCrumb`, `status`) VALUES
(44, 'test/testSession', 30, 1, '测试管理,测试session', 'U'),
(48, 'request/copy', 18, 1, '请求管理,添加请求', 'U'),
(56, 'menu/copy', 22, 1, '菜单管理,添加菜单项', 'U'),
(57, 'test/testNoLogin', 27, 1, '', 'U');