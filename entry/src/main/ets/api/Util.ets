import axios from '@ohos/axios';
import promptAction from '@ohos.promptAction';
import { Attraction } from '../entity/Entity'


export const request = axios.create({
  baseURL: "http://192.168.135.202:8080",
  timeout: 3000
})

export function toUrl(imgName: string) {

  return "http://192.168.135.202:8080" + imgName
}
//请求拦截
request.interceptors.request.use((config) => {
  // 配置一些token
  // config.headers["token"]=""
  print("请求拦截。。。。")
  print(JSON.stringify(config))
  return config;
}, (err) => {
  return Promise.reject(err)
})

//响应拦截
request.interceptors.response.use((response) => {
  print("响应拦截。。。。")
  print(response.data.data)
  return response;
}, (err) => {
  print("响应拦截错误：。。。。" + JSON.stringify(err))
  return Promise.reject(err)
})


export function sendLoginRequest(data, successCallback, errorCallback) {

  request({
    method: 'post',
    url: "/Login",
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


export function sendRegisterRequest(data, successCallback, errorCallback) {

  request({
    method: 'post',
    url: "/Register",
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

// export function sendReservationRequest(data, successCallback, errorCallback) {
//   request({
//     method: 'post',
//     url: "/insertAttractionReservations",
//     headers: {
//       'Content-Type': 'application/x-www-form-urlencoded',
//     },
//     data: data
//   }).then(function (response) {
//     if (successCallback) {
//       successCallback(response);
//     }
//   }).catch(function (error) {
//     if (errorCallback) {
//       errorCallback(error);
//     }
//   });
// }


export function sendReservationRequest(data, successCallback, errorCallback) {

  request({
    method: 'post',
    url: "/insertAttractionReservation",
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


export function Toast(msg) {
  promptAction.showToast({
    message: msg,
    duration: 2000, // 显示时长
    bottom: 300 // 距离底部的距离
  })
}

export function getAllAttraction(successCallback, errorCallback) {
  request({
    method: 'get',
    url: '/allAttraction',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  })
    .then(response => {
      if (successCallback) {
        successCallback(response);
      }
    })
    .catch(error => {
      if (errorCallback) {
        errorCallback(error);
      }
    });
}

export function getAllAttraction1() {
  return request.get("/allAttraction", {
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  })
}

export function getMyAttraction(data, successCallback, errorCallback) {
  return request({
    method: 'get',
    url: '/allAttractionForUser',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    data: data
  })
    .then(response => {
      if (successCallback) {
        successCallback(response);
      }
    })
    .catch(error => {
      if (errorCallback) {
        errorCallback(error);
      }
    });
}


export function getAllOperation(successCallback, errorCallback) {
  request({
    method: 'get',
    url: '/allOperation',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  })
    .then(response => {
      if (successCallback) {
        successCallback(response);
      }
    })
    .catch(error => {
      if (errorCallback) {
        errorCallback(error);
      }
    });
}

export function print(msg) {
  console.log("调试: " + msg);
}

export function sleep(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
