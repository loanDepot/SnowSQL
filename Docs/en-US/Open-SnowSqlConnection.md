---
external help file: SnowSQL-help.xml
Module Name: SnowSQL
online version:
schema: 2.0.0
---

# Open-SnowSqlConnection

## SYNOPSIS
Opens a connection to Snowflake

## SYNTAX

```
Open-SnowSqlConnection [-Endpoint] <String> [-Credential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
Establishes a few important environment values for connecting to snowflake

## EXAMPLES

### EXAMPLE 1
```
Open-SnowSqlConnection -Endpoint contoso.east-us-2.azure -Credential (Get-Credential)
```

## PARAMETERS

### -Credential
Credential for snowflake endpoint

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Endpoint
Snowflake endpoint (ex: contoso.east-us-2.azure)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### SnowSql.Connection
## NOTES
Will also execute a '!help' statement to verify connectivity

## RELATED LINKS
