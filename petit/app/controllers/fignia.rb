 @voting = Voting.create name: "sally", surname: "wally", patronymic: "polly", age: 3

      if @petition.votings.where(surname: @voting.surname, name: @voting.name, patronymic: @voting.patronymic, age: @voting.age).present?
        redirect_to action: :show
        flash[:notice] = "fuck you!"
      else
        @petition.increment!(:votes)
        @petition.votings << @voting
        redirect_to action: :show
        flash[:notice] = "you voting!"
      end