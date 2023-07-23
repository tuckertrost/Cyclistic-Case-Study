# Google Data Analytics Capstone Project: Cyclistic

## Introduction
Demonstrated in this case study are the skills that I have learned in the Google Data Analytics Professional Certificate Course. I will use these skills to 
complete the tasks of a data analyst working for the fictional bike-share company ***Cyclistic***. Following the data analysis process of
**Ask, Prepare, Process, Analyze, Share,** and **Act**, I will complete the business task presented to me and help the company make data-driven decisions.

### Scenario
The Cyclistic Director of Marketing, Lily Moreno, believes the company's future success depends on maximizing the number of annual memberships.
Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will 
design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must apporove our recommendations, so they must
be backed up with compelling data insights and professional data visualizations.

### About the Company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked
into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. 

Cyclistic's appeal is that they offer flexibility in their pricing plans with single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are 
referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic’s finance analysts have concluded that annual members are 
much more profitable than casual riders. Moreno believes there is a very good chance 
to convert casual riders into members. 

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, 
Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends. 

## Ask

### Business Task
Analyze Cyclistic's 2022 trip data to understand how casual riders and annual members use bikes differently. Insights gained from this analysis will help the marketing team develop their strategies for the campaign.

### Stakeholders

**Lily Moreno**: Director of Marketing. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.

**Cyclistic marketing analytics team**: A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy. 

**Cyclistic executive team**: The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

## Prepare
The first step in my prepare process is to download all of the data that I will need for my analysis. We will be using the Cyclistic trip data for 2022 which needs to be download in 12 separtate .csv files for each month of the year and stored in a dedicated folder. The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement). 
## Process
### Data Cleaning
#### Excel
To begin the data cleaning process, I opened each .csv file in excel and did the following
* Checked for and removed any duplicates
* Used the **trim()** function to remove unneeded spaces
* Used the **weekday()** function to create a new column labeled **day_of_week** using (1-7) to represent (Sunday-Saturday)
* Created a new column labeled **ride_length** by subtracting the **started_at** column from the **ended_at** column
* Changed the time format to **37:30:55** to make it more readable
* Removed any rides under **1 minute** or longer than **24 hours** by sorting the speadsheet.

#### SQL
Because of the size of each .csv file I chose to switch over to SQL to continue cleaning and analysis in a more efficient way. However, the sandbox mode in BigQuery only allows you to upload files that are up to 100MB in size. Seeing that there are multiple files that are larger than 100M, I combatted this by creating a bucket using Google Cloud Storage to enable me to upload my larger files where I could then upload them to BigQuery.

After Uploading each of the twelve files, I combined each file into one table labeled **combined_data** using the **union** function. In the same query, I removed each of the rows that contained null values. 

I now had a single table that had all of the clean data needed for my analysis.

## Analyze
To begin the analysis phase, I wanted to reemphasize the business task ***How do casual riders and members use bikes differently?*** 

To answer this question, there were a few things that I identified that I could pull from the data. I wrote queries for the following:
* **Total # of trips per rider type**
* **Total # of trips per rider type per bike type**
* **Average ride length per rider type**
* **Total # of trips and average length of trip per rider type per month, day, and hour of day**
* **Most Popular Start and End Stations per rider type**

All SQL queries can be found [here](https://github.com/tuckertrost/Cyclistic-Case-Study/blob/main/DataAnalysis.sql)

After pulling the specified data with my queries, I noticed a few things right off the bat:
* Members had around a million more trips in 2022 than causl riders.
* Causal riders trips on average lasted around double the length of members
* The summer months had peak activity for both casual and member riders.

Now I had enough data that I could plug into tableau and create some visualzations and a dashboard.

## Share
The dashboard I created for this project can be found on tableau [here](https://public.tableau.com/app/profile/tucker.trost/viz/CyclisticCaseStudy-GoogleDataAnalysticsCertificate/CyclisticCaseStudy)

For my visualizations, I really wanted to emphasize only the data that illustrated the key differences between casual riders and members. To accomplish this, I found that a few of my queries were not crucial to anwering the business task.

I compile my dashboard, I included the following visualizations:
* **Trips per rider type**
* **Trips per Bike Type**
* **Average ride length per rider type**
* **Top Start and end stations**
* **Number of trips per month, day, and hour**

Here is a look at the dashboard

![Dashboard Screenshot](https://github.com/tuckertrost/Cyclistic-Case-Study/assets/132526212/313bb03e-d381-4a50-96d4-293f310e5de3)

Here is a summary of the key differences found between Members and Casual Riders:

**Members:**
* Members primarily use bikes for daily commutes to work, university, etc.
* Top bike stations are strategically located near colleges and office buildings downtown.
* Average ride length is shorter and consistent, indicating routine travel to familiar destinations.
* Peak months are from May to September, coinciding with favorable weather for bike usage.
* Peak activity occurs on weekdays during working and school hours, with spikes at 8 AM, 12 PM, and 5 PM.

**Casual Riders:**
* Casual riders use bikes for leisure and entertainment purposes.
* Top bike stations are located along the waterfront and near popular entertainment attractions.
* Casual riders have longer average ride lengths, using bikes for strolling and exploration.
* Peak months align with the warmer months of the year.
* Peak activity happens during weekends, with steady increases around noon, reaching the highest point at 5 PM.

**Comparison of Casual Riders and Members:**
* Casual riders use bikes for leisure, while members use them for daily commuting.
* Top station locations differ, with members favoring areas near colleges and office buildings, and casual riders near entertainment spots and waterfront.
* Average ride length varies, shorter and consistent for members, longer and more exploratory for casual riders.
* Peak months align with weather for both groups, but peak days differ - weekdays for members and weekends for casual riders.
* Activity spikes occur at different times of the day, with members commuting during work hours and casual riders using bikes mainly during leisure hours.

## Act
Based on my analysis, I came up with the following reccomendations that I believe will help the marketing team create an effective campaign to convert casual riders into members:

***1. Summer Adventure Membership:* Offer a seasonal membership for summer (May to August) tailored for casual riders, emphasizing bikes near waterfront attractions and entertainment spots.**

***2. Waterfront Wonders Promotion:* Advertise the campaign at water-adjacent bike stations popular among casual riders, showcasing the benefits of membership.**

***3. Weekend Explorer Discounts:* Provide exclusive discounts for weekends and longer rides to incentivize casual riders to become members and enjoy cost savings.**

By implementing these concise strategies, the marketing campaign can effectively convert casual riders into valued members, enriching their biking experience during the summer season.




