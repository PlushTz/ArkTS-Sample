class StringUtils {
  isEmpty(value: string): Boolean {
    return value.trim() === '' || value.length == 0;
  }
}

let stringUtils = new StringUtils();

export default stringUtils as StringUtils;