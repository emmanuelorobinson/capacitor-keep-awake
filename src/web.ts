import { WebPlugin } from '@capacitor/core';

import type { KeepAwakePlugin } from './definitions';

export class KeepAwakeWeb extends WebPlugin implements KeepAwakePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
