import http from '@ohos.net.http';
import hilog from '@ohos.hilog';
import NetUrl from '../globle/NetUrl';

class HttpUtils {
  query(city: number) {
    let httpRequest = http.createHttp();
    // httpRequest.on('headerReceive', (header) => {
    //   console.info('header:' + JSON.stringify(header));
    // });
    let url: string = NetUrl.BASE_URL + "key=" + NetUrl.WEB_KEY + "&city=" + city;
    console.info('url:' + url);
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json'
      },
      // extraData: {
      //   "key": NetUrl.WEB_KEY,
      //   "city": city,
      //   "extensions": "base",
      //   "out": "JSON"
      // },
      expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
      usingCache: true, // 可选，默认为true
      priority: 1, // 可选，默认为1
      connectTimeout: 60000, // 可选，默认为60000ms
      readTimeout: 60000, // 可选，默认为60000ms
      usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
    };
    console.info('options:' + JSON.stringify(options));
    httpRequest.request(url, options, (error, data) => {
      if (!error) {
        JSON.parse()
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + JSON.stringify(data.result));
        console.info('code:' + JSON.stringify(data.responseCode));
        // data.header为HTTP响应头，可根据业务需要进行解析
        console.info('header:' + JSON.stringify(data.header));
        console.info('cookies:' + JSON.stringify(data.cookies)); // 8+
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(error));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁。
        httpRequest.destroy();
      }
    })
  }
}

let httpUtils = new HttpUtils();

export default httpUtils as HttpUtils;