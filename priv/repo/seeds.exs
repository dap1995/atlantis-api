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
%User{
  email: "dap1995@gmail.com",
  password_hash: "$2b$12$9Cvo1Qpcdbtk3K2.9r9cS.QEQPVDsiH0EBAV8Nf/KEp2bDMpTaY8W"
} |> Atlantis.Repo.insert!

%Boat{
  name: "Pérola negra"
} |> Atlantis.Repo.insert!

