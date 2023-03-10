import configureMeasurements, { 
{{#measures}}
  {{value}},{{#upper}}{{.}}{{/upper}}Systems,{{#upper}}{{.}}{{/upper}}Units,
{{/measures}}
} from "convert-units";
import {NewSpeedUnits, ExtendedSpeed} from "./speed";

// Measures: The names of the measures being used
type Measures = {{#measures}}{{#first}}'{{value}}'{{/first}}{{#link}} | '{{value}}'{{/link}}{{/measures}};
// Systems: The systems being used across all measures
type Systems = {{#measures}}{{#first}}{{#upper}}{{.}}{{/upper}}Systems{{/first}}{{#link}} | {{#upper}}{{.}}{{/upper}}Systems{{/link}}{{/measures}};
// Units: All the units across all measures and their systems
type Units = NewSpeedUnits | {{#measures}}{{#first}}{{#upper}}{{.}}{{/upper}}Units{{/first}}{{#link}} | {{#upper}}{{.}}{{/upper}}Units{{/link}}{{/measures}};

let config = {
{{#measures}}
  {{value}},
{{/measures}}
};
config = {...config, speed:ExtendedSpeed};
const ConvertUnits = configureMeasurements<Measures, Systems, Units>(config);

/**
 * 单位转换
 * @param value
 * @param from 'cm' | 'm' | 'km';
 * @param to 'cm' | 'm' | 'km';
 * @returns
 */
function convert(value: number, from: Units, to: Units) {
  return from === to ? value : ConvertUnits((value + Number.EPSILON)).from(from).to(to);
}
/**
 * 精度
 * @param value 默认保留两位小数
 * @param precision 0 | 1 | 2
 * @param round true | false 是否四舍五入
 * @returns
 */
function precision(value: number, precision: number = 2,round:boolean = false): number {
  const p = 1 / Number('1e-' + precision);
  // Number.EPSILON避免精度丢失
  return Math[!round?'trunc':'round']((value + Number.EPSILON) * p) / p;
}
export { ConvertUnits,convert, precision };