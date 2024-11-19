# keep-awake

A capacitor plugin to toggle screen sleep prevention

## Install

```bash
npm install npm i @emmanuelrobinson/keep-awake

npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`enable()`](#enable)
* [`disable()`](#disable)
* [`isEnabled()`](#isenabled)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### enable()

```typescript
enable() => Promise<void>
```

--------------------


### disable()

```typescript
disable() => Promise<void>
```

--------------------


### isEnabled()

```typescript
isEnabled() => Promise<{ value: boolean; }>
```

**Returns:** <code>Promise&lt;{ value: boolean; }&gt;</code>

--------------------

</docgen-api>
