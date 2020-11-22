{ pkgs, config, ... }: {
  imports = [ ./module.nix ];
  xsession.windowManager.bspwm = {
    enable = true;
    monitors = {
      "eDP1" = [
        "rip"
        "1"
        "2"
        "3"
        "4"
        "5"
        "browser"
        "emacs"
        "music"
        "msg"
        "terminal"
        "filemanager"
      ];
    };
    rules = {
      "Nautilus" = {
        desktop = "filemanager";
        follow = true;
      };
      "TelegramDesktop" = {
        desktop = "msg";
        follow = true;
      };
      "Hexchat" = {
        desktop = "msg";
        follow = true;
      };
      "Microsoft Teams - Preview" = {
        desktop = "msg";
        follow = true;
      };
      "Emacs" = {
        state = "tiled";
        desktop = "emacs";
        follow = true;
      };
      "qutebrowser" = {
        desktop = "browser";
        follow = true;
      };
      "Spotify" = {
        desktop = "music";
        follow = true;
      };
      "spotify" = {
        desktop = "music";
        follow = true;
      };
      "plasmashell" = {
        state = "floating";
        border = false;
        "layer" = "normal";
      };
      "krunner" = {
        state = "floating";
        "border" = false;
      };
      "discord" = { state = "floating"; };
      "Mpv" = {
        state = "floating";
        layer = "above";
        sticky = true;
        private = true;
        locked = true;
      };
    };
    settings = {
      top_padding = 26;
      bottom_padding = 26;
      focus_follows_pointer = true;
      window_gap = 4;
      border_width = 1;
      honor_size_hints = false;
      focused_border_color = "#fc20bb";
      pointer_follows_monitor = true;
      pointer_follows_focus = false;
      remove_disabled_monitors = true;
      remove_unplugged_monitors = true;
    };
    startupPrograms = let
      bspc = "${pkgs.bspwm}/bin/bspc";
      xrandr = "${pkgs.xorg.xrandr}/bin/xrandr";
      feh = "${pkgs.feh}/bin/feh";
    in [
      "${xrandr} --output eDP-1-1 --primary"
      "${xrandr} --output DP-3.2 --mode 1920x1080 --rate 144 --same-as eDP-1-1"
      "${xrandr} --output DP-3.1 --mode 1920x1080 --left-of DP-3.2"
      "${bspc} desktop %DP-3.2 -r"
      # "\"${config.home.sessionVariables.TERMINAL}\" && ${bspc} node newest -d terminal"
      "tmux new-session -n \"IRC\" -d 'irssi'"
    ];
  };

}