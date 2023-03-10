# @zhangjindong/plugin-convert-units

A umi plugin，根据 umi4 创建的单位转换工具；

目的是统一项目涉及到的前端单位转换

前提条件：项目必须升级到 umi4.

**将会持续收集需要转换的公式（convert-units 中没有的）**

## Install

```bash
pnpm i @zhangjindong/plugin-convert-units
```

## Usage

Configure in `.umirc.ts`,

```js
export default {
  plugins: [["@zhangjindong/plugin-convert-units"]],
  pluginConvertUnits: ["area", "length", "mass", "pressure", "speed", "volume"],
};
```

Configure in `.umirc.ts`,

```js
export default {
  plugins: [["@biomind/plugin-convert-units"]],
  pluginConvertUnits: ["area", "length", "mass", "pressure", "speed", "volume"],
};
```

## Example

```typescript
import { convert } from "umi";
const value = convert(4).from("m").to("cm");
```

## LICENSE

MIT
