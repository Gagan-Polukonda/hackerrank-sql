select signups.user_id
        , Round(cast(avg(rate) as numeric), 2) as confirmation_rate
    from signups,
    (select user_id
    , time_stamp
    , count(case when action = 'confirmed' then 1 else 0 end) as confirm
    from confirmations
    group by 1,2) as rate
