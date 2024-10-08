# linux-commands-shell-scripting

## Weather Forecast ETL Process - Kansas City

## Scenario  
This project develops an automated ETL (Extract, Transform, Load) process to extract daily weather forecast and observed weather data, which is then loaded into a live report for analysis. The main focus of the analysis is to monitor and measure the historical accuracy of temperature forecasts from various sources and weather stations.

A script is scheduled to run daily at 12:00 PM UTC, extracting and loading weather data for Kansas City. The report will also display a section that analyzes historical forecasting accuracy, showing the minimum and maximum absolute forecasting errors over the past week.

## Data Source  
This project uses the weather data provided by the open-source web service [wttr.in](https://wttr.in/), which delivers weather forecast information in a simple, text-based format. More details on the service can be found at [wttr.in GitHub repository](https://github.com/chubin/wttr.in#readme).

To scrape weather data for Kansas City, the `curl` command is used:
```
curl wttr.in/Kansas
```
This command retrieves weather data and outputs it to the terminal.
![image](https://github.com/user-attachments/assets/99a41190-6bae-40a6-93bf-0dc4224aec93)

## Learning Objectives
By completing this project, you will apply shell scripting skills in a real-world scenario to:
- Download raw weather data
- Extract relevant information from the data
- Transform the data as required
- Load the transformed data into a log file in a tabular format
- Schedule the entire process to run automatically at a specified time daily

## Credits
This project is based on the **Linux Commands & Shell Scripting** course by IBM Skills Network on the edX platform.

### Authors:
- Jeff Grossman

### Other Contributors:
- Rav Ahuja

--- 
This repository provides all the necessary scripts and instructions to implement the automated ETL process for weather data in Kansas City.
