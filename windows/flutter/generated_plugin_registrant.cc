//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_picker_pro/file_picker_pro_plugin_c_api.h>
#include <file_selector_windows/file_selector_windows.h>
#include <open_share_plus/open_share_plus_plugin_c_api.h>
#include <share_plus/share_plus_windows_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FilePickerProPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FilePickerProPluginCApi"));
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  OpenSharePlusPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("OpenSharePlusPluginCApi"));
  SharePlusWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SharePlusWindowsPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
