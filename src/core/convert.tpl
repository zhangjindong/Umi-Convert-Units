import configureMeasurements, { length, LengthSystems, LengthUnits, area, AreaSystems, AreaUnits } from "convert-units";
// {{#measures}}{{#first}}{{#upper}}{{.}}{{/upper}}{{/first}}{{#upper}},{{.}}{{/upper}}{{/measures}}
// Measures: The names of the measures being used
type Measures = {{#measures}}{{#first}}'{{value}}'{{/first}}{{#link}} | '{{value}}'{{/link}}{{/measures}};
// Systems: The systems being used across all measures
type Systems = {{#measures}}{{#first}}{{#upper}}{{.}}{{/upper}}Systems{{/first}}{{#link}} | {{#upper}}{{.}}{{/upper}}Systems{{/link}}{{/measures}};
// Units: All the units across all measures and their systems
type Units = {{#measures}}{{#first}}{{#upper}}{{.}}{{/upper}}Units{{/first}}{{#link}} | {{#upper}}{{.}}{{/upper}}Units{{/link}}{{/measures}};

export const convert = configureMeasurements<Measures, Systems, Units>({
{{#measures}}
  {{value}},
{{/measures}}
});
