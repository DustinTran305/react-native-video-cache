import { NativeModules, Platform } from 'react-native';

const { RNVideoCache } = NativeModules;

export const convertToProxyURL = url => {
  if (Platform.OS === 'ios' || Platform.OS === 'android') {
    return RNVideoCache.convertToProxyURL(url);
  }
  return Promise.resolve(url);
};

export const cacheRequestURL = url => {
  if (Platform.OS === 'ios' || Platform.OS === 'android') {
    return RNVideoCache.cacheRequestURL(url);
  }
  return Promise.resolve(url);
};

export const checkExistedURL = url => {
  if (Platform.OS === 'ios' || Platform.OS === 'android') {
    return RNVideoCache.checkExistedURL(url);
  }
  return Promise.resolve(url);
};