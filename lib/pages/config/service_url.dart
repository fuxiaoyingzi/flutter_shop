const BASE_SERVICE_URL = "https://wxmini.baixingliangfan.cn/baixing/";
const HOME_PAGE_CONTENT = "homePageContent";
const HOME_PAGE_BELOW_CONTENT = "homePageBelowContent";
const CATEGORY_CONTENT = "getCategory";
const CATEGORY_GOODS = "getMallGoods";
const GOODS_DETAIL = "getGoodDetailById";
const servicePath = {
  //商店首页信息
  HOME_PAGE_CONTENT: BASE_SERVICE_URL + "wxmini/homePageContent",

  //商店首页火爆商品
  HOME_PAGE_BELOW_CONTENT: BASE_SERVICE_URL + "wxmini/homePageBelowConten",
  //分類接口
  CATEGORY_CONTENT: BASE_SERVICE_URL + "wxmini/getCategory",
  //分类的商品列表
  CATEGORY_GOODS: BASE_SERVICE_URL + 'wxmini/getMallGoods',
  //获取 商品详情
  GOODS_DETAIL: BASE_SERVICE_URL + 'wxmini/getGoodDetailById',
};
