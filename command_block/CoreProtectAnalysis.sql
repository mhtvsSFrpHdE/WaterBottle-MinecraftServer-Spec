select co_block.user as blockUserId, co_user.id as userId, co_user.user as userName, count(*) as userCount
from co_block
inner join co_user on co_user.id = co_block.user
group by co_block.user
order by userCount desc