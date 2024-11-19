import { WebPlugin } from '@capacitor/core';

import type { KeepAwakePlugin } from './definitions';

export class KeepAwakeWeb extends WebPlugin implements KeepAwakePlugin {
  private isKeepingAwake = false; 

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async enable(): Promise<void> {
    console.warn('Keep Awake is not supported on the web.');
    this.isKeepingAwake = true; // Simulate enabling Keep Awake
  }

  async disable(): Promise<void> {
    console.warn('Keep Awake is not supported on the web.');
    this.isKeepingAwake = false; // Simulate disabling Keep Awake
  }

  async isEnabled(): Promise<{
    value: boolean;
  }> {
    return {value: this.isKeepingAwake};  // Return the simulated state
  }
}
