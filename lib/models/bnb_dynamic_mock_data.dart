// 模拟后台接口数据

class DynamicMockData {
  static Future<List<Map<String, Object>>> list(int page, int size) async {
    return List<Map<String, Object>>.generate(size, (index) {
      return {
        'title':
            '标题${index + (page - 1) * size + 1}:这是一个列表，最多两行，多出的部分将会被截取取取~~~~~~~~~~~~~~~~~~',
        'imageUrl':
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fchang-ho.com%2Fhtml%2Fdata%2Fattachment%2Fwq_wechatcollecting%2Farticle%2F201812%2F04%2F337776.jpg&refer=http%3A%2F%2Fchang-ho.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1639016330&t=42e89b64ca69321bb3f12d0be1504bae',
        'viewCount': (index + (page - 1) * size + 1) * 33,
      };
    });
  }
}
