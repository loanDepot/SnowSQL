---
external help file: SnowSQL-help.xml
Module Name: SnowSQL
online version:
schema: 2.0.0
---

# Get-SnowSqlRole

## SYNOPSIS
Get list of Snowflake roles

## SYNTAX

```
Get-SnowSqlRole [[-Name] <String>] [-DSL] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Get list of Snowflake roles

## EXAMPLES

### EXAMPLE 1
```
Get-SnowSqlRole
```

created_on                    name                         is_default is_current is_inherited assigned_to_users granted_to_roles granted_role                                                                                                                        s
----------                    ----                         ---------- ---------- ------------ ----------------- ---------------- ------------
2020-02-01 12:31:05.000 -0800 ACTADMIN                     N          N          N            0                 0                0
2020-02-01 12:31:05.000 -0800 PUB                          N          N          Y            0                 0                0
2020-02-01 12:31:05.000 -0800 SECURITY                     Y          Y          N            0                 0                0
2020-02-01 12:31:05.000 -0800 ADMIN                        N          N          N            0                 0                0

## PARAMETERS

### -DSL
Return the command instead of the results

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Role to return

```yaml
Type: String
Parameter Sets: (All)
Aliases: Role

Required: False
Position: 1
Default value: *
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: True
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

### System.String
## NOTES

## RELATED LINKS
