import axios from '@ohos/axios';
import promptAction from '@ohos.promptAction';

export const request = axios.create({
  baseURL: "http://youker.net:8360",
  timeout: 3000
});

//请求拦截
request.interceptors.request.use((config) => {
  // 配置一些token
  // config.headers["token"]=""
  return config;
}, (err) => {
  return Promise.reject(err)
})

//响应拦截
request.interceptors.response.use((response) => {
  // 配置一些token
  // config.headers["token"]=""
  return response;
}, (err) => {
  return Promise.reject(err)
})


export function sendPostRequest(url, data, successCallback, errorCallback) {

  axios({
    method: 'post',
    url: url,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    data: data
  }).then(function (response) {
    if (successCallback) {
      successCallback(response);
    }
  }).catch(function (error) {
    if (errorCallback) {
      errorCallback(error);
    }
  });
}


export function Toast(msg)
{
  promptAction.showToast({
    message: msg,
    duration: 2000, // 显示时长
    bottom: 300 // 距离底部的距离
  })
}
