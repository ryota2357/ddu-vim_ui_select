import {
  ActionFlags,
  Actions,
  BaseKind,
  DduItem,
} from "https://deno.land/x/ddu_vim@v1.10.1/types.ts";
import { Denops } from "https://deno.land/x/ddu_vim@v1.10.1/deps.ts";
import { ActionData } from "../@ddu-sources/vim_ui_select.ts";

type Params = Record<never, never>;

export class Kind extends BaseKind<Params> {
  actions: Actions<Params> = {
    select: async (args: { denops: Denops; items: DduItem[] }) => {
      const action = args.items[0]?.action as ActionData;
      await args.denops.call(
        "luaeval",
        "require('ddu-vim_ui_select').on_choice(_A.item, _A.index)",
        { item: action.item.raw, index: action.item.index },
      );
      return ActionFlags.None;
    },
  };

  params(): Params {
    return {};
  }
}
