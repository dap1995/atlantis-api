# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Atlantis.Repo.insert!(%Atlantis.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Atlantis.Accounts.User
alias Atlantis.Business.Boat
alias Atlantis.Business.Marine
alias Atlantis.Business.Sailor
alias Atlantis.Business.Schedule

user = %User{
  email: "dap1995@gmail.com",
  password_hash: "$2b$12$9Cvo1Qpcdbtk3K2.9r9cS.QEQPVDsiH0EBAV8Nf/KEp2bDMpTaY8W"
} |> Atlantis.Repo.insert!

boat = %Boat{
  name: "Pérola negra",
  owner: user
} |> Atlantis.Repo.insert!

marine = %Marine{
  name: "Marina 1",
  owner: user
} |> Atlantis.Repo.insert!

sailor = %Sailor{
  name: "Popeye",
  owner: user
} |> Atlantis.Repo.insert!

{:ok, start_date, _} = DateTime.from_iso8601("2019-05-14T16:24:55Z")

%Schedule{
  email: "teste@email.com",
  start_date: start_date,
  owner: user,
  marine: marine,
  boat: boat,
  sailor: sailor
} |> Atlantis.Repo.insert!