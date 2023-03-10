import { Measure, speed, SpeedSystems, SpeedUnits } from 'convert-units';

export type NewSpeedUnits = SpeedUnits | 'cm/s';
export const ExtendedSpeed: Measure<SpeedSystems, NewSpeedUnits> = {
  systems: {
    metric: {
      ...speed.systems.metric,
      'cm/s': {
        name: {
          singular: 'Centimetre per second',
          plural: 'Centimetre per second',
        },
        to_anchor: 0.036 ,
      },
    },
    imperial: {
      ...speed.systems.imperial,
    },
  },
  anchors: {
    ...speed.anchors,
  },
};
