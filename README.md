# SnowSQL

User and Role management for Snowflake using SnowSQL

# Requirements

This module requires that you already have SnowSql installed on your system.

* [Installing SnowSQL](https://docs.snowflake.net/manuals/user-guide/snowsql-install-config.html)

# Git

Clone this repository

    git clone https://github.com/loanDepot/SnowSQL.git

# Building

Run the build script in the root of the project to install dependent modules and start the build

    .\build.ps1

To run only the build, execute Invoke-Build

    Invoke-Build

    # or do a clean build
    Invoke-Build Clean,Default


Install dev version of the module on the local system after building it.

    Invoke-Build Install
