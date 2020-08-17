---
external help file: SnowSQL-help.xml
Module Name: SnowSQL
online version:
schema: 2.0.0
---

# Invoke-SnowSql

## SYNOPSIS
Invokes a Snowflake SQL statement

## SYNTAX

### QueryConnection (Default)
```
Invoke-SnowSql [-Connection <Object>] [-Query <String[]>] [-Timeout <Int>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### PathCred
```
Invoke-SnowSql -Endpoint <String> -Credential <PSCredential> [-Path <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### QueryCred
```
Invoke-SnowSql -Endpoint <String> -Credential <PSCredential> [-Query <String[]>] [-Timeout <Int>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### PathConnection
```
Invoke-SnowSql [-Connection <Object>] [-Path <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Invokes a Snowflake SQL statement

## EXAMPLES

### EXAMPLE 1
```
Open-SnowSqlConnection
```

Invoke-SnowSql -Query '!help'

## PARAMETERS

### -Connection
An existing connection made with Open-SnowSqlConnection

```yaml
Type: Object
Parameter Sets: QueryConnection, PathConnection
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credential for snowflake endpoint

```yaml
Type: PSCredential
Parameter Sets: PathCred, QueryCred
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Endpoint
Snowflake endpoint (ex: contoso.east-us-2.azure)

```yaml
Type: String
Parameter Sets: PathCred, QueryCred
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
SnowSql script file to execute

```yaml
Type: String
Parameter Sets: PathCred, PathConnection
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Query
Query to invoke

```yaml
Type: String[]
Parameter Sets: QueryConnection, QueryCred
Aliases:

Required: False
Position: Named
Default value: !help
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timeout
Snowflake timeout for connexion

```yaml
Type: Integer
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Error handling does not exist at the moment

## RELATED LINKS
