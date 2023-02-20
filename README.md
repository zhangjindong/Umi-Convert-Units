# @umi/plugin-convert-units

A umi plugin，根据umi4创建的单位转换工具；

目的是统一项目涉及到的前端单位转换

前提条件：项目必须升级到umi4.

**将会持续收集需要转换的公式（convert-units中没有的）**

## Install

```bash
pnpm i @umi/plugin-convert-units
```

## Usage

Configure in `.umirc.ts`,

```js
export default {
  plugins: [["@umi/plugin-convert-units"]],
  pluginConvertUnits: ["area", "length", "mass", "pressure", "speed", "volume"],
};
```

## Options

TODO

## LICENSE

MIT
