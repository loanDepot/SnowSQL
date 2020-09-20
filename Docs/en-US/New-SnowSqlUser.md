---
external help file: SnowSQL-help.xml
Module Name: SnowSQL
online version:
schema: 2.0.0
---

# New-SnowSqlUser

## SYNOPSIS
Create a new Snowflake user account

## SYNTAX

```
New-SnowSqlUser [-Name] <String> [-LoginName] <String> [[-Description] <String>] [-DSL] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new Snowflake user account

## EXAMPLES

### EXEMPLE 1
```
New-SnowSqlUser -Name TESTUSER -LoginName TESTUSER@CONTOSO.COM -Description 'AD Account'
```

## PARAMETERS

### -Description
Description of the user account

```yaml
Type: String
Parameter Sets: (All)
Aliases: Comment

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

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

### -LoginName
Login or Active Directory account name

```yaml
Type: String
Parameter Sets: (All)
Aliases: UserPrincipalName

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
Name of the Snowflake user

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
Current use case is for creating AD users in Snowflake.
Local accounts may need different options.

## RELATED LINKS
