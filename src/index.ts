import { join } from "path";
import type { IApi } from "umi";

export default (api: IApi) => {
  api.describe({
    // ['area','length','mass','pressure','speed','volume']
    config: {
      // default: ["area", "length", "mass", "pressure", "speed", "volume"],
      schema(joi) {
        return joi.array().items(joi.string());
      },
      onChange: api.ConfigChangeType.regenerateTmpFiles,
    },
    enableBy: api.EnableBy.config,
  });
  api.addOnDemandDeps(() => [{ name: "convert-units", version: "^3.0.0-beta.5" }]);

  api.onGenerateFiles(async () => {
    api.writeTmpFile({
      path: "index.ts",
      tplPath: join(__dirname, "./core/convert.tpl"),
      context: {
        measures: (api.config.pluginConvertUnits || ["length"]).map((value: any, index: number) => ({ value, index })),
        upper: function () {
          return this.value.slice(0, 1).toUpperCase() + this.value.slice(1).toLowerCase();
        },
        first: function () {
          return this.index === 0;
        },
        link: function () {
          return this.index !== 0;
        },
      },
    }); // types.d.ts
    api.writeTmpFile({
      path: "types.d.ts",
      content: "export {}",
    });
  });
};
