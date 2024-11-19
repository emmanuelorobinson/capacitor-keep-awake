export interface KeepAwakePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
