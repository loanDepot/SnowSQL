---
external help file: SnowSQL-help.xml
Module Name: SnowSQL
online version:
schema: 2.0.0
---

# Disable-SnowSqlUser

## SYNOPSIS
Disable user account

## SYNTAX

```
Disable-SnowSqlUser [-Name] <String> [-DSL] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Disable user account

## EXAMPLES

### EXAMPLE 1
```
Disable-SnowSqlUser -Name TEST_USER
```

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
Name of user to disable

```yaml
Type: String
Parameter Sets: (All)
Aliases: SamAccountName

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
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

## RELATED LINKS
