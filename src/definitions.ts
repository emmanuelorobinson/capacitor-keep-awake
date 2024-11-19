export interface KeepAwakePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  enable(): Promise<void>;
  disable(): Promise<void>;
  isEnabled(): Promise<{ value: boolean }>;
}
