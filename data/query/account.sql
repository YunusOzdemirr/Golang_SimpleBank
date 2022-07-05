-- name: CreateAccount :one
INSERT INTO accounts (owner,balance,currency) VALUES ($1, $2, $3) RETURNING *;

-- name: GetAccounts :one
SELECT * FROM accounts 
where id = $1 LIMIT 1;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY id
LIMIT $1
OFFSET $2;

-- -- name: UpdateAccount :exec
-- UPDATE accounts SET balance  = $2 WHERE id= $1;


-- name: UpdateAccount :exec
update accounts set balance = $2 where id $1 RETURNING *;


-- name: DeleteAccount :exec
delete from accounts where id = $1;