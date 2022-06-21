---
layout: page

title: Stanford Open Datathon Group Project


hidden:
redirect:
category: [community]
importance: 1

date: 2021-04-12 #  YYYY-MM-DD, must be specified
start:
end:
display_date: # used instead of `date` or date range

img: /assets/img/covid_7.png
github: jennarsimon/sodp-team114 # uname/repo, don't include the prefix `https://github.com/`

description: Data scientist in a 5-student international group
bullet_points: | # at least two bullet points
    - Team research project analyzing misinformation related to coronavirus vaccination hesitancy and sentiment and semantics of the COVID19 pandemic
    - We literally worked around the clock for the weekend of the Datathon
---

This 2021 Stanford Open Datathon project analyzed misinformation related to coronavirus vaccination hesitancy. I worked with 4 other undergraduates &mdash; Jenna Simon, Kopal Mathur, Teddy Sandler, and Masaya Heywood &mdash; from 3 different time zones in the United States and Australia over the April 9th-11th 2021 weekend. As a team, we agreed on a research focus. Next, Teddy and I searched for datasets, took observations, and quantitatively verified our hypotheses. Then Jenna and Kopal composed a formal discussion of our research. Finally, Jenna published our findings online. You can view our final website [here](https://sodp-team114.herokuapp.com) and our Github repo [here](https://github.com/jennarsimon/sodp-team114) (or [here](https://github.com/JacobFV/sodp-team114) if that repo gets deleted).

I'm missing a lot of contributions though. Masaya had informative observations on every step of the project. This was a real learning experience for me in listening and communicating with individuals from nontechnical backgrounds. Below I share my personal written and analytical contributions and cite those that originated from my group members. See the [notebook](https://colab.research.google.com/drive/1VO9ZLQQ94SEziAA-xXh6njGIwOnK54GO?usp=sharing) if you'd like to follow along in the exposition below:

## Introduction

To combat the overwhelming spread of inaccurate information regarding the pandemic on public platforms (such as social media), our goal is to identify the most prevalent false statements about the vaccine so that they can be purposefully countered with data-driven factual information.

Here we identify the continued trend of negative sentiments towards the COVID-19 vaccine using Twitter data. The most prevalent anti-vaccination beliefs are likely to emerge from analyzing tweet content, hashtags, and user engagement since the official declaration of the COVID-19 pandemic in March 2020. Isolating these beliefs allows public officials to focus efforts on combating the specific pieces of misinformation that may have the most harmful effect on public health.

## Experiments and Observations

### Sentiment towards the COVID vaccine is normally distributed with many borderline individuals

We began by taking an unbiased sample of the 'corona_tweets9.csv' dataset[^1] which tabulates twitter statement sentiment towards COVID vaccination for the date of March 26, 2020 12:51 PM - March 27, 2020 11:53 AM, we find it follows a normal distribution (mean = 0.04918822590081064, median = 0.0). Notably, the interquartile range is all positive. However notice the large number of outliers outside a small center:

[^1]: [https://ieee-dataport.org/open-access/coronavirus-covid-19-tweets-dataset](https://ieee-dataport.org/open-access/coronavirus-covid-19-tweets-dataset)

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_1.png' | relative_url }}" alt=""/>
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_2.png' | relative_url }}" alt=""/>
    </div>
</div>

Since there is a significant spike in the distribution around the mean, we wanted to explore the distribution while excluding -0.05 <= x <= 0.05. We find this significantly shifts the IQR and central tendency. (mean = 0.09570094913863447, median = 0.13392857142857142) Additionally, it qualitatively accentuates the skewness of the vaccination sentiment distribution. However, once the IQR has been adjusted for this new biased sample, few outliers remain. See the following graphics:

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_3.png' | relative_url }}" alt=""/>
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_4.png' | relative_url }}" alt=""/>
    </div>
</div>

Next, we wanted to analyze the distribution of strictly negative sentiment. We arbitrarily chose x <= -0.05 as our data filter. Repeating the above procedure, we observe a large shift in central tendencies suggesting a large proportion of negative sentiment towards the vaccine. (mean = -0.30970065211674563, median = -0.22083333333333333). See the following figures:

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_5.png' | relative_url }}" alt=""/>
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_6.png' | relative_url }}" alt=""/>
    </div>
</div>

Finally, we compare the negative case with the opposite. Filtering for x >= 0.05, the mean = 0.3124805752967794 and the median = 0.25. We found it surprising that the right tail (x>=0.05) has a lower absolute change in mean than the left (x<=-0.05) since earlier we observed that the unbiased sample has a completely nonnegative IQR.

The above observations suggest that there are many borderline positive sentiment twitter statements while the fewer number of negative sentiment tweets are on average more negative than the positive sentiment statements are positive.

### Twitter sentiment towards the COVID vaccine follows an oscillatory trend

Our next observational study focused on the temporal evolution of COVID vaccine sentiment. This experiment used the Covid Vaccine Tweets [^2] which collects tweets made with the hashtag #CovidVaccine. For technical reasons, we were only able to explore a very small subset of this data (15 Aug 2020 - 18 Aug 2020), yet we were still surprised by the mean sentiment trend. Initially, we hypothesized mean sentiment towards the COVID vaccine to remain stable. However observing its evolution, we found an oscillatory - perhaps critical - behavior. We present this data in both raw and savgol smoothed (window_length = 51, polyorder = 3) line plots below:

[^2]: [https://www.kaggle.com/kaushiksuresh147/covidvaccine-tweets](https://www.kaggle.com/kaushiksuresh147/covidvaccine-tweets)

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_7.png' | relative_url }}" alt=""/>
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_8.png' | relative_url }}" alt=""/>
    </div>
</div>

We do not believe the time series suggests a rapid shift of general opinion. Rather, we believe it identifies fundamental divergence of Twitter activity by COVID vaccine sentiment. Perhaps these oscillations also indicate overall balanced conversation bouncing back-and-forth with pro- and anti- vaccine statements.

### Twitter statements towards the COVID vaccine cluster semantically

Our last experiment studied the semantic content of #CovidVaccine tweets using the same dataset as above. This time, for technical reasons we filtered the first 273 elements of the dataset that had a strictly negative (x <= -0.05) sentiment. We used the BERT language model to construct 768-dimensional vector representations of each tweet. Since BERT is trained by unsupervised masked token autoencoding, we expect similar Twitter statements to have similar vector values. To find the clusters of similar statements, we used the Python library hypertools[^3] to graph 3D embeddings of each tweet vector representation using k-means clustering. Please see our 3D visualization and the accompanying statements for k=10 clusters. In the first graph, we cluster by the last BERT token embedding on its final self-attention layer and in the second graph we show clusters when all final layer token values are pooled across the sequence.

[^3]: [https://hypertools.readthedocs.io](https://hypertools.readthedocs.io)

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_9.png' | relative_url }}" alt=""/>
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_10.png' | relative_url }}" alt=""/>
    </div>
</div>

Since the last token embedding clusters - our first image - showed greater cluster separateness, we employ it for qualitative analysis of Twitter sentiment. Confirming our hypothesis that COVID vaccine statements do cluster semantically, we find relatively uniform cluster sizes of &#123;&#124;N_i&#124;&#125;0<=i<10 = {37, 45, 9, 51, 56, 24, 54, 2, 22, 29} indicating that there are few outlier statements. For the reader's pleasure, we have included the full clustered textual data in Appendix A. To further test our cluster claim, we perform the above visual analysis on a disjoint subset of data taken from the same dataset (index 400 - 999) and observe similar visualizations for k = 10 clusters:

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_11.png' | relative_url }}" alt=""/>
    </div>
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" src="{{ '/assets/img/covid_12.png' | relative_url }}" alt=""/>
    </div>
</div>

As an unintended side effect of the sentence-level vector embedding clustering approach we selected, some clusters form with a central idea that arguably has nothing in common with COVID. For example, cluster 0 in Appendix A appears to wander around thoughts pertaining to different countries without necessarily centering on disparity of policy, vaccination rollouts, etc.

## Conclusions and future research

Our SODP Team 114's conclusion[^4] was:

> "We feel the above observations identify a strong mistrust in the scientific understanding of the COVID-19 vaccine development process and the Government, with a belief in the scientific mismanagement of vaccine initiatives. Public perception of the vaccine rollout and its swift development process stems from the belief that the initiative may attempt to pacify the pandemic without considering public welfare and easing long-term effects.
>
> With the aid of social media platforms, information regarding the COVID-19 pandemic reaches people from a wide range of demographics. The reception of information by each demographic is dependent on their level of intuition and reflection when consuming media content; a lack of this may motivate the panic-driven spread of false information.
>
> Increasing public trust in the vaccine requires increasing the public's understanding of the vaccine. By focusing education efforts on clarifying the vaccine's development process, rather than trying to disprove each myth surrounding the vaccine, officials can most efficiently increase public support of the vaccination initiative in the interest of general health."

[^4]: full text on [project site](https://sodp-team114.herokuapp.com/)

If our analysis extended to temporal series, we would expect to observe echo-chain networks emerge.

In the future, we would like to explore:

- What bias does Twitter introduce by its user pool compared to other social networking platforms?
- How does COVID vaccine sentiment cluster demographically and psychographically?
- What factors are associated with individuals who play a role as large hubs promoting anti-vaccination sentiment on twitter?

## Appendix A: Cluster statements

Note to the reader: We do not filter these Twitter statements for language, profanity, or other content metrics to minimally bias our data.

```
Looking at cluster 0 with 37 elements:

Deaths due to COVID-19 in Affected Countries
Read More: https://t.co/V8Y3Stu0UW
@r_piryani @shitalbhandary… https://t.co/6jpMxX2KtI
Biocon Executive Chairperson Kiran Mazumdar Shaw contracts coronavirus, informs on Twitter… https://t.co/eojjwPsw11
Nearly 500 deaths, most with the second wave of #coronavirus #COVIDVIC19 and it's appears that other waves are poss… https://t.co/slh5lY8i9D
Preparations to #COVID19 related 31st special session of #UNGA, initiated by #Azerbaijan and #NAM is going on.… https://t.co/z1vYGjaoBH
Serum Institute Of India starting phase 2 trails of the Oxford-AstraZeneca vaccine this week. 10 centres short list… https://t.co/E6uER9A4aT
#CovidVaccine- Scare!!Be careful
Russia and China has itself approved a novel Coronavirus vaccine in a similar fas… https://t.co/iRZrHbOzZs
If you've been wondering how virus mutation might impact vaccine efficacy, here is the latest:

#CovidVaccine… https://t.co/tbwzw6KZ2K
In 2018 there were 50,000 deaths in the UK from flu.
We are currently at 41,000- and that is with months of dodgy r… https://t.co/smbBKCGIag
Federal officials are working with California, Florida, Minnesota, North Dakota, &amp; Philadelphia to develop plans to… https://t.co/4ytTyCd3eB
Vaccines R wonderful, protecting against viruses which do not exist. 15 Ukrainian Soldiers were given #CovidVaccine… https://t.co/PEjGm2jsFB
A targeted recruitment programme broadcast in Gujarati, Punjabi, Bengali and Urdu is among the measures being deplo… https://t.co/7AR9tVnnK4
$TFFP thin film freezing pharmaceutical reformulation platform potential starting to get attention

#CovidVaccine… https://t.co/oT2s5WlkHQ
A COVID-19 Vaccine Is About To Be Tested In D.C. With Hundreds of Volunteers  https://t.co/Jwp8jIhPQ7 via @wamu885… https://t.co/ItY79q6r9F
I've registered for #CovidVaccine trials 👇https://t.co/va1pP84hhX
$navx #covidvaccine efficacy trial underway! In South Africa, in part backed by Gates. Nimble company.
https://t.co/E336G959B9
@TMZ I don`t give a shit.....will NEVER get it. I work for myself anyway so they can stick it where the sun don`t s… https://t.co/XbPiByXsJY
Russia produces first batch of #covidvaccine -19 . #safetyfirst ?? No #phase3 trial?? https://t.co/3NqCQv5fEe
#SurakshaBeforePariksha
Sir @DrRPNishank please postphone the NEET&amp;JEE as the threat of #COVID19  is still there!… https://t.co/XPiWCNNc8N
Fall in line or else be ready to become a social pariah. #CovidVaccine #obey #facemasks #scamdemic
#Delhi #CovidVaccine
Much respite to Delhites from #COVID19 -- Only 8 deaths, around 900 new cases in past 24 hours. Recovery Rate 90%.
Infographic of 'top' SARS-Cov2 vaccines
#CovidVaccine
https://t.co/CZrXo4zpRd
3rd stage of Russia's Covid-19 vaccine may begin in 7-10 days

#COVID19 #CovidVaccine

https://t.co/OnTf9uwJ3g
President Rodrigo Duterte recently accepted Russia's offer of free vaccine, although not completing the 3rd Phase o… https://t.co/B1V514Aras
TRUMPNIK TRAILER ENG (full video on my tiktok) #diplein IN MEMORIAM - Eduard Anatolyevich Jil​ #donaldtrump… https://t.co/JfE8hDhK4n
First it was by end of year, then it was Dec, now its 2021. Oxford #Coronavirus vaccine update: Phase III trials to… https://t.co/0CpdMCpNqQ
Anyone have any idea what will be the name of the first COVID vaccine approved in Russia? Using three type of lopin… https://t.co/rf1ziae957
Can't wait for #AntiVacciners' reaction to the #CovidVaccine. This would be the real test of determination.

Of al… https://t.co/Y2FVNGGG5K
Vaccines are safe. But huge numbers of people around the world say they wouldn't take a Covid jab | @CNN

#CV19… https://t.co/exMQYy5qVZ
#CovidVaccine #coronavaccine COVAXIN: Bharat Biotech's COVID-19 vaccine found safe in early trial  https://t.co/xRQ4aU4rUF
#coronavirus is a #plandemic so #billgates can #depopulate the world. #drfauci is helping him. #gardasil #autism… https://t.co/TgOrNE78mO
A local pharmaceutical company had expressed interest to reproduce a #CovidVaccine that other countries may develop… https://t.co/UDodOplVD6
================================================================================================

Looking at cluster 1 with 45 elements:

#DNA  zooms up charts in 1st week; hear #vaccines episode: https://t.co/oDrayhi7zN . #pandemic , #COVID19 , #CovidVaccine
Global Vaccine Tracker

#vaccines #CovidVaccine https://t.co/hzhwKSUfV7
Coronavirus India Update: Active confirmed cases 673166, deaths 51797, See State Wise List

#CoronavirusIndia… https://t.co/JNg4bBCXkw
ISLAMABAD: Pakistan has begun phase III of the clinical trial of a COVID-19 vaccine candidate in the country after… https://t.co/mhkNCRs9wg
COVID-19 Vocabulary English: Outbreak.

Click here : https://t.co/bOU5xkMpxC via @YouTube

 #COVID19
#COVID__19… https://t.co/9Mk7ykMTYN
India records decline in daily Coronavirus cases for 3rd day in a row!!! #Corona #RussianVaccine #CovidVaccine
COVID-19: Human Trails of desi Vaccine begin in Belagavi

Video Link ►https://t.co/Bc0dT7vajM

#TV9Kannada… https://t.co/rAiZO6BYE4
"Journalism can never be silent: That is its greatest virtue and its greatest fault. It must speak, and speak immed… https://t.co/uvbKuQ5f3g
Pfizer is looking to sign up people for a covid vaccine study. You get a drug or a placebo. Then OVER THE NEXT 2 YE… https://t.co/Alht77F81g
#Novavax said on Monday it started a mid-stage study of its experimental #COVID19 #vaccine in #SouthAfrica, as the… https://t.co/BIKN4u5mlM
First time in 5 months ..Today More people are cured than infected from coronavirus..Is this the beginning of the e… https://t.co/3uITSN8MTL
$GERN up 7% today.... It's either going to cure #BloodCancer or go go down in flames.... But I will wait...… https://t.co/wxZHvtsajV
National Expert Group on Vaccine Administration meets the Domestic Vaccine Manufactures
PIB (@PIB_India)… https://t.co/Eoci6vseWv
#Corona #iHeartDynamite #iHeartDay1Contest #CovidVaccine #Trump2020 #BidenHarrisLandslide2020 #MAGA donald trump jo… https://t.co/D9CwLkIgBl
More than 1,000 people in the US have died of coronavirus nearly every day this month
#USA #died… https://t.co/39XmbOcFvB
Do you know the story of Hanneke Schuitemaker? #COVIDvaccine  https://t.co/0bmdf2okN0?
Sanofi Snags Another US Biotech Asset With $3.7 Billion Deal For Principia Biopharma
https://t.co/4CrQsZYWFT… https://t.co/NCehFKfzS4
$CVAC $69,52 is jumping 24,36% now. #CureVac #COVID19 #CovidVaccine  https://t.co/WmSGMnShAV
Automatic Hand Sanitizer Machine |Budget Hand Sanitizer Machine |Corona Prevent |Rajtecinfo
https://t.co/YD3DjZEDTN… https://t.co/Zufw44Gaes
A mutation of COVID-19 found in Malaysia is the predominant strain found in Europe and US  https://t.co/LsNZZjWmH0… https://t.co/wGgJNOKrML
Covid warriors will be the first ones to get vaccine: MoSH. IMD gives heavy rainfall warning to Maharashtra. Find o… https://t.co/uVwvK9ifTt
China grants 1st patent to indigenously developed #covidvaccine

- https://t.co/XYCpAMVfXt
When we get the #covidvaccine I call--republicans can only get it from USPS.
Keep your pets indoor in this situation.

#Covid19Millionaires #CovidVaccine #COVID19 #covid19pets https://t.co/5jsnl7qCAx
Malaysia has detected new Mutated strain of Coronavirus D614G that is 10 times more Infectious than other strains o… https://t.co/XQX07LqNm8
#China inactivated vaccine (#Sinopharm) seems a safe candidate that generates immune response. Here latest article,… https://t.co/InfMTgBrRK
In a Global Pandemic of Covid-19 India has Some Bigger problems to Findout who is #Binod
Click here to See my Late… https://t.co/37DD40wTHO
"We need to be diligent during phase-3 trials. We are going to vaccinate so many people. So, even mild or moderate… https://t.co/w2qX5Ckp53
Dr #BillGates got you covered 😭😭😭🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇🦇 #CantMakeThisShitUp @billgates billionaire who wants to he… https://t.co/f9RNKxvCWJ
First Russia
Now China

#CovidVaccine
@RahulGandhi @BJP4Bihar @narendramodi @HMOIndia @ChouhanShivraj @AAI_Official
Please read this once #please… https://t.co/HxSdbSPw3S
WHO chief scientist Dr Soumya Swaminathan has said it might take at least 1-1.5 years to develop a COVID-19 vaccine… https://t.co/cbytFtkIyA
Post Unlock 3.0,  Girls have been more eager for a waxing than a vaccine. #CovidVaccine
Where do you Stand on Covid19 -
The Risk Ladder.
#COVID19India #COVID #CoronavirusOutbreak #CoronavirusVaccine… https://t.co/vvyptamchM
@SBICard_Connect I have raised complaints which have not yet been addressed by your side , kindly address these by… https://t.co/8OHLbAAlyj
As other countries race to find a #CovidVaccine, Russian President Vladimir #Putin announced the first approved vac… https://t.co/pLuK34jdnD
A lot of people will be really eager to get it," she said. "A lot will be hesitant, not only because of misinformat… https://t.co/OmY4T8PNBs
@jbouie @KevinMKruse Xllnt question that should be asked at *every* press conference of *every* leader until there'… https://t.co/woIrCBUNhE
#CovidVaccine now available from  Aliexpres like all the crap from China it wont arrive until you forgot you bought… https://t.co/yqlJNXL4fh
Every crisis demands self discipline, patience, early adaption, and adjustment to the changing situation.… https://t.co/RSnt0BYr9Q
================================================================================================

Looking at cluster 2 with 9 elements:

Four Techniques Olympic Athletes Will Use To Retain Their Skills For Another Year

https://t.co/oXlREDXvsB… https://t.co/tQS9sN1btz
Fresh cases in #Italy &amp; #NewZealand... 10 times more deadly virus discovered in #Malaysia ... #China has literally… https://t.co/nPInmMFcuy
IF THIS vaccine is reliable, when will it be available for LARGE-scale vaccinations??? (August 17, 2020; 10:46 HKT)… https://t.co/0Vvj2GiLGO
@smh I wouldn't trust a word that comes out of Health Minister Greg Hunts mouth. He hasn't even made face masks com… https://t.co/w7hG9i2LVu
Covid-19 vaccine Sputnik V yet to complete advanced trials review WHO, however Russia started production… https://t.co/kmADwT4GKj
3rd stage of Russia's Covid-19 vaccine may begin in 7-10 days #coronavaccine  #CoronavirusPandemic  #CovidVaccine… https://t.co/MpLgQfQTnJ
Awaiting for the day when whole world would be Corona-free! #CovidVaccine
#CovidVaccine The Vaccine Race: Who Gets It First?/Dilip Bobb's India Legal Cover srory
https://t.co/qDMkwGroH6
Any Update For Coronavirus Medicine By  Indian Co ?#BurjKhalifa #endeducationalockdown #RussianVaccine… https://t.co/hPULVVqT7z
================================================================================================

Looking at cluster 3 with 51 elements:

@PrivilRodrigues @yatish57 @deepkaranahuja @shristi522 @Amrita33392520 @RashmiSriniva14 @AkashRK_88 @SJanaQA… https://t.co/VPLa11fwfr
Is more dangerous yet to come?
#CovidVaccine #Corona #Immunization #CoronavirusPandemic #mutation #D614GVirus
D614… https://t.co/PxwPLlt67w
.@SerumInstIndia is looking to raise up to $1 billion (around Rs 7,500 crore) for Covid-19 vaccine development. Det… https://t.co/LTXSkBcI90
CORONAVIRUS UPDATES - American businessman with Turkish-Armenian roots leads COVID-19 vaccine development… https://t.co/EsBS5MC4kW
How will be vaccinate the world?
#vacine #vaccinate #coronavirus
#covidvaccine
Source: @BBCNews Design: Mark Hall https://t.co/lagiNuN9Zb
phase 3 trials begin in next 7-10 days, what does it mean for a vaccine which is already launched. :( #CovidVaccine… https://t.co/yKVon5bqX0
"You must tell yourself, no matter how hard it is,or how hard it gets,I am going to make it"@Gettodoor1 #VoreDay… https://t.co/XrYjsUirKz
#Coronavirus #vaccines update  After Russia, #China grants patent to #CanSino vaccine,  phase III testing underway… https://t.co/OSVnAww5lK
@realDonaldTrump your gonna go down as the worst President of all time... All you did in 4 years is dodge Stormy Da… https://t.co/iDbMKggxvQ
@DeAnna4Congress Only thing the vaccine is going to do is give you the fly hairs growing on your back. #BrundleFly #CovidVaccine
More coronavirus vaccine volunteers needed #vaccine #COVID19 #CovidVaccine https://t.co/C1XZuazC5S
Just received my tracking implant err, I mean the experimental #CovidVaccine 😅
Now waiting for any immediate side e… https://t.co/IOW2xzL6t2
Just enrolled into a pivotal phase 3 clinical trial of COVID vaccine. Stay tuned for weekly updates. #CovidVaccine… https://t.co/wo0TKTwKuv
@WhipClyburn Other dearth warrant is the lack of funding to @InovioPharma  , they have the best data with no side e… https://t.co/9hIQSXvyCE
A strain of the novel #Coronavirus that is 10 times more infectious has been found in #Malaysia
#Corona… https://t.co/XsFBE00mME
Turkey, Russia discuss cooperation on Moscow's coronavirus vaccine #COVID19 #CovidVaccine  https://t.co/qiibwIVHaH
Russia's First batch of Coronavirus Vaccine is ready
#Russia has #announced its #victory with the #vaccine for… https://t.co/lDlFnyAEtV
#coronavirus | Russia's #COVID19 vaccine comes with major safety issues, says Nobel laureate @ProfPCDoherty… https://t.co/uh8iGq2pEM
IQOO 5 and 5 Pro Launched hindi 👇
https://t.co/JZLkUsDGos
#iqoo #iqoo5 #iqoo5pro #iqoo3 #samsung #Xiaomi #realme… https://t.co/OMh69M0WrZ
#China has granted first invention patent to a #COVIDvaccine co-developed by #CanSinoBiologics Inc in the country,… https://t.co/UNCclqHBmC
By withholding from the world the original genetic code of the China Virus that it created, the Chinese Communist P… https://t.co/vZCLm8lWs7
My wife's off for her #covidvaccine booster this morning. There shall be cake and coffee when she gets back from
Thx for the shout out @BiometricUpdate! When the #covidvaccine is released, the world will embark on one of the mos… https://t.co/MKjXTf7qAZ
Malaysia detects new #coronavirus strain that's 10 times more infectious. #COVID19 #CovidVaccine #Secondwavecovid https://t.co/Iw7U6fteiD
Check out kingkhieu's video! #TikTok #COVID19 #CovidVaccine  https://t.co/1AjjXjG6Us
#IndependenceDayIndia2020 felicitation to Dr B Partha Sarathy Reddy Hetero drugs @heteroofficial Remdesivir for cov… https://t.co/GtZNPzKjUu
Even if a #CovidVaccine could be developed in the coming months, and garner @US_FDA approval, the distribution and… https://t.co/PVDothRgIH
Bali may not welcome foreign tourists at all this year | #Travel #tourism #Indonesia #Bali #foreigntourists #COVID-… https://t.co/BJtgbFptMb
#COVID19. Recovery rate in India has crossed 72%. #CovidVaccine is in the pipeline. https://t.co/o9Q16f8f2T
ICYMI: Catch the second episode of the Bharatvaarta Weekly where we talk about #IndependenceDayIndia, #CovidVaccine… https://t.co/hWSU2kkGfM
"We need to be diligent during phase-3 trials. We are going to vaccinate so many people. So, even mild or moderate… https://t.co/DTDhcRGmz4
True, don't put Students and parents at risk. Postpone all exams before any #CovidVaccine
Govt need to understand t… https://t.co/vNDwfb9Tiq
Heard about that Russians have made a vaccine..named 'Sputnik'

Why are we not getting the vaccines?...
#SputnikV… https://t.co/3y1g7f2uhx
Third stage of Russia's Covid 19 vaccine may begin in 7-10 days.
#CoronavirusVaccine
#CovidVaccine
#SputnikV… https://t.co/z7ybrqLLZS
According to the Tass news agency, several tens of thousands of people are expected to take part in this research o… https://t.co/RSGlBcvBmY
#Coronavirus vaccine Offender in #China Reveals immune Reaction, enters Stage 3 trial #covidvaccine… https://t.co/Q6HB2mnRXM
#CovidVaccine #Russia #coronavirus
The satya show @absolutesatya https://t.co/Z6dTj7LYJC
@jayfeely @POTUS He told us he had scheduled meetings for #COVID19, the economy &amp; #CovidVaccine so he couldn't thro… https://t.co/JBWcRnqBLJ
#COVID__19 #CovidVaccine #prevention #trump
Thermal screening for COVID-19, the clue to reopening as a layer of sa… https://t.co/kwmCAKqBWU
Everyone must be careful for his / her health ...  #India #IndiaFightsCorona #Corona #CoronaWarriors #healthcare… https://t.co/KlG9FMVFwD
Doctor behind Pulse Polio bats for COVID-19 vaccination policy

#CovidVaccine #coronavaccine
#COVID19India… https://t.co/jG6UaXKNvw
Some scientists said they fear Moscow may be putting national prestige before safety #Russia #CovidVaccine… https://t.co/KLyt5g1gje
@TeraceGarnier @NIH @Newsy Point is us has failed again. . And Russia has delivered.  The vaccine #CovidVaccine

https://t.co/RiK6XXwzHe
Latest #coronavirus #COVID19
Stats. Lots of hot spots but a slow decrease as a positive. #CovidVaccine
Trials takin… https://t.co/WOQZbQaRhV
================================================================================================

Looking at cluster 4 with 56 elements:

The Multi-system Inflammatory Syndrome-Children (MIS-C) w/ #COVID19 (atypical Kawasaki disease) #COVID19India

The… https://t.co/98wj2CEkez
it's over?!

#Covid19Millionares #covid19
#corona #CovidVaccine
Attend #webinar on #pediatrics #neonatology and #primarycare #conference and get #internationalcertificate!!! Also… https://t.co/xgE2ZPCCUT
#CovidVaccine 29 Candidates begin trials and 6 of them at phase-3 of clinical trials.

https://t.co/q8X0nsD50Y
#Russia produces first batch of #Covid vax; set to roll out from August endhttps://www.magzter.com/article/Newspape… https://t.co/H0aEFUJOo8
When I see the corona recovery is going better in here.
#covidinengland #coronavirus #england #CovidVaccine https://t.co/yxed28kVpy
The National Sports Awards likely to be held virtually due to COVID VIRUS pandemic

#COVID19
#CovidVaccine… https://t.co/tmLvMZEdlM
"...Get ready for a long wait. Even if the Australian Government signs an advanced purchase agreement to secure pri… https://t.co/4IFfrJ8S4J
Brazil's state-run Oswaldo Cruz Foundation (@fiocruz) will commence production in December of an initial 100 millio… https://t.co/NHMuExZCOx
U.S. drug developer #Novavax says its experimental #COVID19 #vaccine is starting the 2nd phase of testing in… https://t.co/Dbk8qNOTCL
Question: has anyone successfully signed up? My parents can't because the promised email link doesn't arrive. Is it… https://t.co/dL2FSc4Rzo
Bought 500 shares of $IBIO this dip won't hold long. I have a pt of $5 however could obviously run to $7-10 $MARA $SMRT $AVGR #COVIDVACCINE
Doctors seeking @rautsanjay61 's resignation from #Maharashtra CM @uddhavthackeray

#DoctorSecondSingle #Doctor… https://t.co/HE5G7kQtTE
NIAID Funding Opportunity: NOT-AI-20-065, Notice of Special Interest (NOSI)—Emergency Awards for Limited Clinical T… https://t.co/LtCYT5RlGL
I dont know much about covid 19 but Mask laga laga ke meri sase jrur fulne lagi hai.
#CovidVaccine #COVID19India
#CovidVaccine - a lot of people are ready &amp; eager to get it, but many will be hesitant not just because they're war… https://t.co/G9RAYlcCIZ
"A mutation of COVID-19 found in Malaysia is the predominant strain found in Europe and US"
#CovidVaccine https://t.co/gaPQDD1PEh
#CovidVaccine under clinical trial in Oregon as Doctors step up for humanity.  https://t.co/necEDc7wx1
COVID-19 vaccine race: China approves first coronavirus vaccine patent https://t.co/Z0Rubc2Ujf #covidvaccinerace… https://t.co/tDX5WZx534
Will you get a COVID-19 vaccine when there is one? The pandemic won't end unless enough do. via @USATODAY #COVID-19… https://t.co/dGUl1tH15s
The vaccine known as ChAdOx1 is the most advanced COVID-19 vaccination candidate. Now in the final phases of the cl… https://t.co/ua0IJJTEvR
COVID Vaccine: Who will get coronavirus vaccine first in India?

#CovidVaccine #CoronavirusIndia

https://t.co/9DrfPlXjiA
Is Trump serious with his new Oprah-Book-Club-pick for COVID-19  cures? First hydroxychloroquine and now Oleander?… https://t.co/pUtXyBUbf3
First batch of RUSSIAN vaccine ready, roll out from August-end, says report (August 17, 2020; 10:46 HKT)… https://t.co/BRTGa7HcNi
COVID-19 Vocabulary English: Pathogen.
Click here : https://t.co/mhb1GlLQmH via @YouTube
#COVID19
#COVID__19… https://t.co/M7oALM0mMk
This mutation, earlier seen in other parts of the world and called D614G, was found in at least three of the 45 cas… https://t.co/9nrl3mR9Nf
Oh great, this'll really help us in the queue...
Can't #Morrison do anything right?
( @GregHuntMP ends up doing mor… https://t.co/qyUCU8w4CZ
#Russia's new Sputnik launch raises risks in dash for #CovidVaccine 👀🤖
 https://t.co/q3OWx8soLF
@TimesNow This man has got a verbal diarrhea..
Keeps he shit coming out of his mouth..
#CovidVaccine
And many many many many references to 170,000 Covid deaths, of which the Trumps care not the ass of a rat. 🐭… https://t.co/cBZzmWWWuH
2020  Trial Version Year

Before                    NOW #4GTrial
#CovidVaccine |    In #Kashmir https://t.co/K2GhobwJgm
My reaction when someone asks me when will vaccine come 😂

#COVID19 #CovidVaccine https://t.co/QkkFHlw5Il
#covidVaccine we have a long long way to go still people! Mask up!!! #covid19SA https://t.co/R7EcWFNeID
@governorswaraj Prediction for #CovidVaccine by @rvaidya2000 https://t.co/bEUBdfqGiv
#dmart Hadapsar seems to have managed to invent / get access to a #CovidVaccine given the way they are giving entry… https://t.co/64CmBkGakM
#OOTT

I expect huge #CrudeOil price rise the moment vaccine is announced

Oil demand will be back to normal within… https://t.co/Qaqh71XkeZ
To Know more about my work , click on this link - https://t.co/ZJuSXd6nqf

#mask #sanitizer #engagement… https://t.co/dwt0Vh6E4x
Some intresting graphics on Covid-19

#coronavirus #COVID #CovidVaccine #coronavirusinindia https://t.co/jAX6rZJ5PS
63,489 more COVID-19 cases in India, death toll nears 50,000-mark | Poll Strategies | Management | Digital Bharat -… https://t.co/1XRaiSTmfb
#CovidVaccine  Reconstruction  of a Mass Hysteria: The Swine Flu Panic of 2009 https://t.co/3hltOyKQXD via @derspiegel
Just some Cue connections with #Fauci #BillGates #HIVAIDS #COVIDVaccine #CrimesAgainstHumanity https://t.co/yxUgG5o53y
Chinese regulator says vaccines must have 50% efficacy, give 6 months' immunity

Products that meet the efficacy st… https://t.co/zvLdhiL6Uv
Been quiet for a few days.  Working on a write-up about @moderna #moderna &amp; it's prospects &amp; whether it's a wise… https://t.co/YR9YpZE8tC
Dr. Peter Hotez, professor at Baylor College of Medicine, explains the findings of a new AP Poll which shows that o… https://t.co/UheFgnskUM
Who had this on their 2020 bingo card? #vaccines #COVID19 #CovidVaccine  https://t.co/zsYVQl18El
After I take.... The Russian
#CovidVaccine https://t.co/aONiY6wZIp https://t.co/rF3GprN0IW
Prime Minister Narendra Modi while addressing the nation on the 74th Independence Day said that three vaccines for… https://t.co/TwlCZVjIis
I did this 😭😭😭

Sorry Putin 😭 #CovidVaccine https://t.co/whUiNSFWx6
================================================================================================

Looking at cluster 5 with 24 elements:

Turkey, Russia discuss cooperation on Moscow's coronavirus vaccine #COVID19 #CovidVaccine
https://t.co/NE994CCbgn https://t.co/2fynnacIiE
The beautiful heat is killing covid-19 in Los Angeles #CovidVaccine
#Wuhan CHINA

China ended LOCKDOWNS 7/April. Either China already made the VAXX before they UNLEASHED #COVID19 on… https://t.co/4mVi49h3Ku
I think waiting for that freedom 251 phn is rather better than waiitng for this vaccine.!😝😂
#gocorona #CovidVaccine #lockdowndays😴
Science and Technology for UPSC Lecture-8 I UPSC EXAM 2020 I By Akash So... https://t.co/4Qf3VPkONF via @YouTube… https://t.co/yORj6MRmsr
Its predicted, once d vaccine is in d market China will come out with a vaccine
#CovidVaccine https://t.co/Osl2Jjyj7n
#DonaldTrump  To #Putin  after
#CovidVaccine 😂😂😂 https://t.co/gHUv6ublVS
COVID-19 recovered patients protected during massive outbreak on U.S vessel. How long do anti-bodies last in a COVI… https://t.co/oZ3UuFdHLi
According to Health Undersecretary Maria Rosario Vergeire, Avigan stocks for 100 patients are already in the countr… https://t.co/bHEdoGKr0i
I say we ban #covidvaccine from Trumpians.
Watch #TNMNewsInaNutshell with @PoojaPrasanna4 on #TelanganaRains #HyderabadRains #BengaluruRiot updates and… https://t.co/8Z59mWl6nF
@MrShikharMisra @Imawear @KathyB143 @lesliea10115 @SummerPic @teacuptutucharm @cathyjotaylor Same to you Shik.… https://t.co/fCcW3uHBTW
#5G the silent killer just like #DirectedEnergyWeapons cause damage. #SmartMeter #Smartphone give off radiation.
Wi… https://t.co/14xoES03ut
Going to Russia to collect the first batch of #CovidVaccine https://t.co/J1P9AYFU3l
Bad news for #CovidVaccine believers❗️
The new #D614G mutation of the #coronavirus strain will render current… https://t.co/Ut41P2QG9Y
Russia produces first batch of #CovidVaccine , to be given to doctors https://t.co/9ODFLnYJN2 #CoronavirusVaccine #coronavirus
Australia has no agreement in place I'm pleased the Govt is moving towards that How are we best placed around the w… https://t.co/bDrwEGEgEv
Bio-Voting is next
Remember this tweet
Bio-Tech is your #iWatch, #CovidTesting, #covidvaccine
- why is the 🇺🇸 the… https://t.co/ZfKlnah8xG
St. Anger – "I'm madly in anger with you." Message to #Congress #DefundThePolice #MedicareForAll #Covidvaccine… https://t.co/pRWRaizzBh
================================================================================================

Looking at cluster 6 with 54 elements:

@MSNBC Well, let's qualify that: would anyone of any party get a vaccine rushed out and minimally tested coming from Russia? #CovidVaccine
The whole narrative on the #CovidVaccine has gone deathly silent! #ChinaVirus #COVID19India
COVID-19 Vocabulary English: Incubation Period.
Click here : https://t.co/1MmQsmjFSR via @YouTube

#COVID19… https://t.co/NfFQiw9cw3
Serum Institute Of India starting phase 2 trails of Oxford-AstraZeneca vaccine this week
10 centres short listed ac… https://t.co/Mq9LRVzNFa
We must have adequate representation in these vaccine trials.  #vaccinetrials #covidvaccine https://t.co/Z7BioCBpDs
Saw this thought it was funny #vaccines #CovidVaccine #BillGatesIsNotADoctor https://t.co/JZWxw7Rjqo
Marainthu pogum subtitle has been added..
Link - https://t.co/8M05LvIscp
#marainthupogum #fightagainstcorona… https://t.co/x674NugJoi
Do you trust #Russia &amp; #VladimirPutin on #RussianVaccine for #coronavirus ?

#russiavaccine #RussiaReport #COVID19… https://t.co/CkDBE5HejA
Postpone NEET &amp;JEE EXAMS
@narendramodi
large numbers of life are at stake of risk.
#COVID19  #flood #CovidVaccine
Covid-19 vaccine trials have been slow to recruit Black and Latino people -- and that could delay a vaccine… https://t.co/HFnn2dxIon
Russia's COVID-19 vaccine has received regulatory approval for foreign markets(Reuters). Interestingly they chose t… https://t.co/YfTmi3rNrE
There's constant buzz about developments with a #COVID Vaccine but not every source is reputable. Find the most up… https://t.co/qIeMhicBqe
IQOO 5 and 5 Pro Launched hindi 👇
https://t.co/P5oJeOfNYq
#iqoo #iqoo5 #iqoo5pro #iqoo3 #samsung #Xiaomi #realme… https://t.co/EGCWRQfNpq
Genuinely curious:  I can understand vaccine takes time but why there is still no over-the-counter 10 min kind of t… https://t.co/vF7gC4q9te
COVID-19 Vocabulary English: Pandemic.

Click here :https://t.co/EVHdPGOoie via @YouTube
 #COVID19
#COVID__19… https://t.co/s3NjjqCeh6
Russia's new Sputnik launch raises risks in dash for #Covidvaccine!!
Join with us online #Vaccinerd2020
Twitter:… https://t.co/3Doz0NSRiF
A #CovidVaccine should be fairly made &amp; distributed. Only a vote for a #BidenHarrisLandslide2020 will make sure tha… https://t.co/AruGyzee1G
An imp ques??

People already infected with #coronavirus will they be eligible for vaccination as and when the… https://t.co/6q1h4tXmP9
Ebselen is used to treat multiple diseases, including bipolar disorder and hearing loss.

#Covid19 #Coronavirus… https://t.co/JTwdmTUZvI
Mexico President Says COVID-19 Vaccine Expected to be Ready Early Next Year: Live Breaking News Headlines &amp; Coronav… https://t.co/EWYAeFRpU7
@drgsrao 🙋

#HerdImmunity doesn't work out without #vaccine #CovidVaccine.

Please follow @FaheemYounus tweets you… https://t.co/WAYtur3WXC
"We can rush science but we can't rush the human response to a vaccine. We have to see what the long term sustainab… https://t.co/kE0co1lDV1
It will be a year before #CovidVaccine is ready: WHO scientist Soumya Swaminathan - The New Indian Express https://t.co/7UZMxDE2Ef
somebody told me they think the president has the vaccine for Covid but he's with holding it because of population… https://t.co/y9s79ohfmR
@PureNewZealand https://t.co/RJqM58JoXE #NewZealand #NZ Love from #India #COVID19 #CovidVaccine #corruptionmustfall… https://t.co/sJugRTJjmy
Boring life😕😕 #ItsOkayToNotBeOkayEP16  #Apple  #BoycottSadak2  #Apple  #besaf  #COVIDー19  #COVID19  #fashionstyle… https://t.co/rz2uhQnocs
I purchased ivermectin/faviflu from a pharmacy nearby and the guy gave a look as if I bought a flavored condom or a… https://t.co/VnKjBmlWwO
#NagpurAlert : 512 persons tested +ve from #Nagpur (373 City &amp; 139 District) today till 5 pm; and 25 died of… https://t.co/iII4w0QEeN
Director of the Gamaleya Center Alexander Gintsburg said that mass vaccination against COVID-19 in Russia will begi… https://t.co/DuVR0DyvFb
The exponential rate at which the patients are being discharges given the inferior infrastructure is a matter of cy… https://t.co/mJYYz2DdHe
The third stage of the research on the world's first registered #vaccine against the novel #coronavirus, called… https://t.co/GfymPUgQsV
#azaadi from masks. When is this happening?
#COVID19 #CovidVaccine https://t.co/mtioeYNRdS
@JNJNews @harvardmed @nature @nytimes China's already entering Phase 3. They started in January. As the niece of a… https://t.co/QQexbYM07D
2 minute silence for those who were thinking that Modi will launch #COVID #CovidVaccine on #15August #15Ago… https://t.co/8g3dMszI4y
When developing a #covidvaccine is there anyway to add permanent mosquito repellent in there??
A local #pharmaceutical company had expressed interest to reproduce a #CovidVaccine that other countries may develo… https://t.co/fnHmAOEulM
Imagine we end up speaking Russian
😭😭😭😭😭😭😭
#CovidVaccine #RussianVaccine #COVID19 https://t.co/JbYIsR5yb0
How long will it take, after the first vaccine is released, for @BillGates and #TonyFauci claims that #COVID19 has… https://t.co/iT2M2EbFD0
#webnews21 #ExaBFF #ExaBLINK #ExaAMRY #CovidVaccine #COVID #CoronaVirusUpdates #covidfreeworld #Bitcoin #usa… https://t.co/WBRjKW9gov
================================================================================================

Looking at cluster 7 with 2 elements:

#COVID19   No-one is safe until everyone is safe (#WHO). So important when we think about #CovidVaccine / #vaccine… https://t.co/XDXGn89pgg
================================================================================================

Looking at cluster 8 with 22 elements:

Search chennai corona affected street or area wise https://t.co/eqIPQlcCoP

#CovidVaccine #Covid19Chennai #COVID19… https://t.co/atfmdDFHrQ
#covid19: #Pune study shows seroprevalence of antibodies in 51.5% samples

#COVID19India #CovidVaccine… https://t.co/fPRQAfOSxu
"A single vaccination with ChAdOx1 nCoV-19 induced a humoral and cellular immune response in rhesus macaques," the… https://t.co/QBf0k2Ds05
#CovidVaccine will b mandatory 4 those in schools, once avail.
Meantime NYC tells-U-2-report-2-school like cattle 2… https://t.co/rjCmYgZBht
Often when you think you're at the end of something, you're at the beginning of something else. #hope #CovidVaccine… https://t.co/GRMcxe8leJ
India silently on the job of giving the world a #CovidVaccine. Clinical trials in phase-2 in progress -"COVID-19 va… https://t.co/fTMtwiwCgZ
Vaccines are safe. But huge numbers of people around the world say they wouldn't take a COVID jab
#vaccines… https://t.co/HWu5oRsdUS
L⭕️⭕️K &amp; Learn!#WakeUpAmerica #WalkAwayFromDemocrats #COVID19 #CovidVaccine #Covid19Millionares #Plandemic… https://t.co/Q04or6KRVb
I've signed up. Have you?? #CovidVaccine
BBC News - More coronavirus-vaccine volunteers needed
https://t.co/E30Bxz2rWM
@BW Covid-19= 19 ways to TERRORIZE A NATION into accepting dangerous DNA-altering VA$CINATIONS. #ID2020… https://t.co/w11lSNyMSh
A local #pharmaceutical company had expressed interest to reproduce a #CovidVaccine that other countries may develo… https://t.co/aCgJWMahG2
Houston-area doctor at center of controversial coronavirus cure video do... https://t.co/xpYmsS5WeO #COVID19 #COVID #Covid_19 #CovidVaccine
@Jaywalk90075373 @GavinNewsom It's nuts and now they're talking about getting the flu shot if you don't think they'… https://t.co/2BxSeE30JI
Now who did this 🤣😂 #CovidVaccine https://t.co/Ikyg1ibbqj
Public attitude towards Covid19 is now same as towards a guest who has overstayed.

#COVID19India #CovidVaccine
There is a very old virus called 'Hunger.' Every year this virus kills 3.1 million kids. Its cure is easy, that's c… https://t.co/IPXgILqaYy
When will we have a vaccine? What's happening worldwide?

#CovidVaccine #COVIDー19

https://t.co/D8pitrl8vx
@CNN "I have underlying health issues ... I would want to see enough studies in a long-term period of what the rami… https://t.co/E5dy4FGO62
================================================================================================

Looking at cluster 9 with 29 elements:

@Team_Subhashree @subhashreesotwe @iamrajchoco Stay safe @subhashreesotwe di &amp; @iamrajchoco da ❤️❤️… https://t.co/ayhoaQm0Ls
Most countries, without the ability to make #Vaccines locally, will be forced to rely on others like the US, China,… https://t.co/QUCozLB4Ru
Pro killing babies party on this week please watch , @MMFlint @MichelleObama @springsteen @BarackObama… https://t.co/AhNoTTiAFG
Leaks from Russian lab
#CovidVaccine https://t.co/Ygv1OZEMLF
Just so we're clear on how I feel about a #covidvaccine https://t.co/0jSI8gGQKP
Underground Hip Hop

#Hiphop #InstrumentalMusic #undergroundhiphop #boombap #hiphopbeats #hiphopculture #lofihiphop… https://t.co/y3Eeil4rDt
USA doctors wake up #CovidVaccine https://t.co/QjVClsd6MC
HCQ works when given early and/or as a preventative measure. #lancetgate #CERB #DefendTheNorth #coronavirus… https://t.co/QC74RIpMNF
"A vaccine can protect us from an infectious disease. It cannot, however, provide immunity from the multiple person… https://t.co/DjpYWZFp9O
China's first patent granted for COVID-19 #vaccine https://t.co/MnXk0Y00KY #CoronavirusVaccine #CovidVaccine
I hope when #CovidVaccine gets out,these influencers who are out their partying thinking they are immune, and in th… https://t.co/LtWXCHvX3i
Novavax begins mid-stage study of COVID-19 vaccine in South Africa https://t.co/qL24JAnAjN
#COVID__19… https://t.co/KhkrpZHMkh
China, the ground zero of the novel #coronavirus outbreak, confirmed on Sunday its first #CovidVaccine patent devel… https://t.co/HJ5u19LnJn
$cvac up another 74% in German trading. Worth as much as $bntx now. Buckle up for more craziness.

 #covidvaccine $mrna $nvax
@newsinnerwest @smh If there is no #CovidVaccine before 31st #Decemebr 2020, it's probably not a good idea to have… https://t.co/FDdJBzn40x
@DigMemePray Well there you go, STILL want the #CovidVaccine 🤔
One of the richest men alive &amp; still #brainwashed en… https://t.co/ySMNMH7RuM
@sunriseon7 Does he say it's in the begging, mid or towards to the end of next year. Really can not wait for… https://t.co/vsWaSBWDXP
COVID19 pandemic infection spreads like wildfire. It infected people and affected business across sectors, tech exe… https://t.co/qrYi7crJKB
#BOOMExplains: When can a vaccine testing involve human trials?
Dr. @AnantBhan talks about various stages of vaccin… https://t.co/5Px1p2R9Kx
India's hunt for #Covid19 vaccine. Take a look at this report. (@PoojaShali) (@Milan_reports)

#Coronavirus… https://t.co/vFQWeS9Kiy
Abu Dhabi-based G42 Healthcare has partnered with wearable technology firm, WHOOP, for the Whoop4Humanity initiativ… https://t.co/FvXBoc3l9r
Covid-19: (Corona virus) | What precautions should we take
https://t.co/JfKTAeexDx

#CovidVaccine #COVID__19 #CoronaVirusUpdates
PM Modi Updates On Covid #Vaccine: '3 In Testing, Awaiting Nod To Produce &amp; Distribute'
#CovidVaccine #COVID19 https://t.co/suLiib9I45
My mother passed away💔not a Covid patien but this protocol was applied to her;we just received her ashes;deshumaniz… https://t.co/fPsY42NNzT
================================================================================================
```
