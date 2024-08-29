# Cinema Backend

## Deployment

1. Install yarn

```bash
npm i -g yarn
```

2. Install node_modules

```bash
yarn
```

3. copy '.env.example' -> '.env'

4. run project

```bash
yarn start
```

## Documentation

### Enums

<table border="1" style="width: 100%">
    <tr>
        <th>Name</th>
        <th>Key</th>
        <th style="text-align: center">Value</th>
    </tr>
    <tr>
        <td rowspan='2'>EUserStatus</td>
        <td>INACTIVE</td>
        <td style="text-align: center">1</td>
    </tr>
    <tr>
        <td>ACTIVE</td>
        <td style="text-align: center">2</td>
    </tr>
    <tr>
        <td rowspan='2'>EUserRole</td>
        <td>USER</td>
        <td style="text-align: center">1</td>
    </tr>
    <tr>
        <td>ADMIN</td>
        <td style="text-align: center">2</td>
    </tr>
</table>
