const _ = {
  clamp(number, lower, upper) {
    let lowerClampedValue = Math.max(number, lower);
    let clampedValue = Math.min(lowerClampedValue, upper);
    return clampedValue;
  },
  inRange(number, start, end) {
    if (end === undefined) {
      end = start;
      start = 0;
    }
    if (start > end) {
      let temp = end;
      end = start;
      start = temp;
    }
    let isInRange = (start <= number) && (number < end)
    return isInRange;
  },
  words(string) {
    return string.split(' ');
  },
  pad(string, length) {
    if (length <= string.length) {
      return string;
    } else {
      let paddingStart = Math.floor((length - string.length) / 2);
      let paddingEnd = length - string.length - paddingStart;
      return ' '.repeat(paddingStart) + string + ' '.repeat(paddingEnd);
    }
  },
  has(object, key) {
    const hasValue = object[key]
    if (hasValue != undefined) {
      return true;
    } return false;
  },
  invert(object) {
    const invertedObject = {};
    for (let key in object) {
      const originalValue = object[key];
      invertedObject[originalValue] = key;
    }
    return invertedObject;
  },
  findKey(object, predicate) {
    for (let key in object) {
      let value = object[key];
      let predicateReturnValue = predicate(value);
      if (predicateReturnValue) {
        return key;
      }
    }
    return undefined;
  },
  drop(array, n = 1) {
    const droppedArray = array.slice(n);
    return droppedArray;
  },
  dropWhile(array, predicate) {
    const cb = (element, index) => {
      return !predicate(element, index, array);
    };
    const dropNumber = array.findIndex(cb);
    const droppedArray = this.drop(array, dropNumber);
    return droppedArray;
  },
  chunk(array, size = 1) {
    let arrayChunks = [];
    for (let i = 0; i < array.length; i += size) {
      arrayChunks.push(array.slice(i, i + size));
    }
    return arrayChunks;
  }
}


// Do not write or modify code below this line.
module.exports = _;